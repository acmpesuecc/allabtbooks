import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Books_involved extends StatefulWidget {
  @override
  _Books_involvedState createState() => _Books_involvedState();
}

class _Books_involvedState extends State<Books_involved> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7EFE5),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'BACK',
                        style: GoogleFonts.rosarivo(
                            fontSize: 14, color: const Color(0xff545454)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Books involved:',
                          style: GoogleFonts.mali(
                              fontSize: 24, color: const Color(0xff30011E)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: const Color(0xffC4C4C4),
                          height: 200,
                          width: MediaQuery.of(context).size.width * 2 / 5,
                        ),
                        Container(
                          color: const Color(0xffC4C4C4),
                          height: 200,
                          width: MediaQuery.of(context).size.width * 2 / 5,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.43,
                      child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (BuildContext ctx, int i) {
                            return InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 1,
                                    color: const Color(0xffA4A4A4),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Book name 1',
                                      style: GoogleFonts.rosarivo(fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 1,
                                    color: const Color(0xffA4A4A4),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 4))
                        ],
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'SET MEETING POINT',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rosarivo(
                            fontSize: 18, color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
