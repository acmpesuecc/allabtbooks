import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Final_Details extends StatefulWidget {
  const Final_Details({Key? key}) : super(key: key);

  @override
  _Final_DetailsState createState() => _Final_DetailsState();
}

class _Final_DetailsState extends State<Final_Details> {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 31,
                        color: Color(0xff545454),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
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
                    padding: const EdgeInsets.fromLTRB(8.0, 48, 8, 8),
                    child: Row(
                      children: [
                        Text(
                          'Time:',
                          style: GoogleFonts.rosarivo(
                              fontSize: 24, color: const Color(0xff30011E)),
                        ),
                        Text(
                          '23 December 2022 9:10 am',
                          style: GoogleFonts.rosarivo(
                              fontSize: 14, color: const Color(0xff545454)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Location:',
                          style: GoogleFonts.rosarivo(
                              fontSize: 24, color: const Color(0xff30011E)),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.transparent),
                          ),
                          child: Text(
                            'See on google maps',
                            style: GoogleFonts.rosarivo(
                                fontSize: 14, color: const Color(0xff545454)),
                          ),
                        )
                      ],
                    ),
                  ),
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
                        'ADD',
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
