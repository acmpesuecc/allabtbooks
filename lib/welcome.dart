import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2196F3),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Please enter your phone number',
                    style: TextStyle(
                        color: Color(0xffB8E0D2), fontWeight: FontWeight.w400),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 145.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Color(0xffB8E0D2)),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffffffff))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffffffff))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffffffff))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff064789)),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 32),
                        child: Text(
                          'GET OTP',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
