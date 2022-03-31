import 'package:allabtbooks/init.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum ScreenState { MOBILE_NO_STATE, OTP_STATE }

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  ScreenState curr_state = ScreenState.MOBILE_NO_STATE;
  final mobFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  String mob_no = "";
  String otp = "";
  String countryCode = "+91";
  String? _verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      print("Trying Signin Function");
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      print("pushing");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => InitializerWidget()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  Widget get_mob_state(BuildContext context) {
    return Form(
      key: mobFormKey,
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Row(
            children: [
              Expanded(
                child: CountryCodePicker(
                    onChanged: (val) {
                      countryCode = val.toString();
                    },
                    initialSelection: "IN",
                    showFlagMain: false,
                    textStyle: TextStyle(fontSize: 17, color: Colors.black),
                    dialogSize: Size(300, 400)),
              ),
              Expanded(
                flex: 4,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val == null) {
                      return "Please enter a valid moble number.";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => setState(() {
                    mob_no = value!;
                  }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text("Verify"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
            onPressed: () async {
              final isValid = mobFormKey.currentState!.validate();
              if (isValid) {
                mobFormKey.currentState!.save();

                setState(() {
                  showLoading = true;
                });
                await _auth.verifyPhoneNumber(
                    phoneNumber: countryCode + mob_no,
                    verificationCompleted: (phoneAuthCredential) async {
                      setState(() {
                        showLoading = false;
                      });

                      signInWithPhoneAuthCredential(phoneAuthCredential);
                    },
                    verificationFailed: (verificationFailed) async {
                      setState(() {
                        showLoading = false;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(verificationFailed.message!),
                          duration: const Duration(minutes: 2)));
                    },
                    codeSent: (verificationId, resendingToken) async {
                      setState(() {
                        showLoading = false;
                        curr_state = ScreenState.OTP_STATE;
                        _verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) async {
                      print("AutoRetrievalTimeout");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InitializerWidget()));
                    });
              }
            },
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }

  //TODO: Impement a good otp entry field
  Widget get_otp_state(BuildContext context) {
    return Form(
      key: otpFormKey,
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (value) => setState(() {
              otp = value!;
            }),
            validator: (val) {
              if (val!.length != 6) {
                return "Enter valid OTP";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text("Confirm"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
            onPressed: () async {
              print("Confirm Pressed");
              final isValid = otpFormKey.currentState!.validate();
              if (isValid) {
                otpFormKey.currentState!.save();
                print(otp);
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: _verificationId!, smsCode: otp);

                signInWithPhoneAuthCredential(phoneAuthCredential);
              } else {
                print("Code Not Valid");
              }
            },
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AllABtBooks"),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("/assets/images/angel.jpg"),
                fit: BoxFit.cover),
          ),
          child: showLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: curr_state == ScreenState.MOBILE_NO_STATE
                      ? get_mob_state(context)
                      : get_otp_state(context),
                ),
        ));
  }
}
