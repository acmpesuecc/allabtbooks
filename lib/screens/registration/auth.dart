import 'package:allabtbooks/screens/registration/init.dart';
import 'package:allabtbooks/models/styles.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'personal_info.dart';

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
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PersonalInfo()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  Widget get_mob_state(BuildContext context) {
    return Form(
      key: mobFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "AllAbtBooks",
            style: GoogleFonts.rosarivo(
                textStyle: TextStyle(fontSize: 47, color: Color(0xffFFEDD1))),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              children: [
                CountryCodePicker(
                    onChanged: (val) {
                      countryCode = val.toString();
                    },
                    initialSelection: "IN",
                    showFlagMain: false,
                    textStyle: GoogleFonts.rosarivo(
                        fontSize: 16, color: AuthStyle.getAuthColor()),
                    dialogSize: Size(300, 400)),
                Container(
                  width: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: AuthStyle.getAuthColor()),
                    decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFEDD1))),
                        hintText: "Enter your phone number",
                        hintStyle: GoogleFonts.rosarivo(
                            fontSize: 16, color: AuthStyle.getAuthColor())),
                    validator: (val) {
                      if (val == null || val.length != 10) {
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 16,
          ),
          TextButton(
            child: Text(
              "Get OTP",
              style: GoogleFonts.rosarivo(fontSize: 22, color: Colors.black),
            ),
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(150.0, 50.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  //side: BorderSide(color: Colors.red)
                )),
                backgroundColor:
                    MaterialStateProperty.all(Colors.white.withOpacity(0.5))),
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InitializerWidget(
                                    registering: true,
                                  )));
                    });
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
        ],
      ),
    );
  }

  //TODO: Impement a good otp entry field
  Widget get_otp_state(BuildContext context) {
    return Form(
      key: otpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Verify\nNumber",
            textAlign: TextAlign.center,
            style: GoogleFonts.rosarivo(
                textStyle: TextStyle(fontSize: 47, color: Color(0xffFFEDD1))),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          // TextFormField(
          //   keyboardType: TextInputType.number,
          //   onSaved: (value) => setState(() {
          //     otp = value!;
          //   }),
          //   validator: (val) {
          //     if (val!.length != 6) {
          //       return "Enter valid OTP";
          //     } else {
          //       return null;
          //     }
          //   },
          // ),
          OTPTextField(
            length: 6,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 40,
            style: TextStyle(fontSize: 17, color: Color(0xffFFEDD1)),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            onCompleted: (pin) {
              otp = pin;
              onOtpPressed();
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 16,
          ),
          ElevatedButton(
              child: Text(
                "Verify",
                style: GoogleFonts.rosarivo(fontSize: 22, color: Colors.black),
              ),
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(Size(150.0, 50.0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    //side: BorderSide(color: Colors.red)
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.5))),
              onPressed: onOtpPressed),
          SizedBox(height: MediaQuery.of(context).size.height / 12),
        ],
      ),
    );
  }

  void onOtpPressed() async {
    final isValid = otpFormKey.currentState!.validate();
    if (isValid) {
      otpFormKey.currentState!.save();
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: _verificationId!, smsCode: otp);

      signInWithPhoneAuthCredential(phoneAuthCredential);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/auth_bg.png"),
                fit: BoxFit.cover),
          ),
        ),
        showLoading
            ? Center(child: CircularProgressIndicator())
            : curr_state == ScreenState.MOBILE_NO_STATE
                ? get_mob_state(context)
                : get_otp_state(context),
      ],
    ));
  }
}
