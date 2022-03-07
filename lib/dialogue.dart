import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dialogue extends StatefulWidget {
  const Dialogue({Key? key}) : super(key: key);

  @override
  _DialogueState createState() => _DialogueState();
}

class _DialogueState extends State<Dialogue> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle 37.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Color(0xff565656),
                      size: 31,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.add,
                            color: Color(0xff565656),
                            size: 31,
                          ),
                        ),
                        Icon(
                          Icons.delete,
                          color: Color(0xff565656),
                          size: 31,
                        )
                      ],
                    )
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext ctx, int i) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          15 /
                                          20,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF7EFE5)
                                              .withOpacity(0.85),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(21.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Place:",
                                                  style: GoogleFonts.rosarivo(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "See on google maps",
                                                  style: GoogleFonts.rosarivo(
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff545454)),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Time:",
                                                  style: GoogleFonts.rosarivo(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "23 December 2022 9:10 am",
                                                  style: GoogleFonts.rosarivo(
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff545454)),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Books:",
                                                  style: GoogleFonts.rosarivo(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "Book1 for Book2",
                                                    style: GoogleFonts.rosarivo(
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xff545454)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: const [
                                                  Icon(Icons.done,
                                                      color: Color(0xffA1CF6B)),
                                                  Icon(Icons.close,
                                                      color: Color(0xffD62839))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          15 /
                                          20,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF5D3AD)
                                              .withOpacity(0.95),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(21.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Place:",
                                                  style: GoogleFonts.rosarivo(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "See on google maps",
                                                  style: GoogleFonts.rosarivo(
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff545454)),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Time:",
                                                  style: GoogleFonts.rosarivo(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "23 December 2022 9:10 am",
                                                  style: GoogleFonts.rosarivo(
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff545454)),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Books:",
                                                  style: GoogleFonts.rosarivo(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "Book1 for Book2",
                                                    style: GoogleFonts.rosarivo(
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xff545454)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: const [
                                                  Icon(Icons.done,
                                                      color: Color(0xffA1CF6B)),
                                                  Icon(Icons.close,
                                                      color: Color(0xffD62839))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
