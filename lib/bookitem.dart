import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/angel.jpg'),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.9),
                        BlendMode.luminosity,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 27,
                        color: Color(0xff000000),
                      ),
                    ),
                    Row(children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark,
                          size: 27,
                          color: Color(0xff000000),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.local_library,
                          size: 27,
                          color: Color(0xff000000),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Positioned(
                top: 75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 176,
                            width: 123,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: (AssetImage('assets/images/angel.jpg')),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 30,
                                    blurRadius: 50,
                                    offset: const Offset(0, 4)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 36, 0, 8),
                            child: Text(
                              "Angels and Demons",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mali(
                                  fontSize: 36, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Text(
                            "Dan Brown",
                            style: GoogleFonts.rosarivo(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Reviews",
                          style: GoogleFonts.mali(
                            fontSize: 24,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 510,
                        width: MediaQuery.of(context).size.width - 50,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4)),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18.0, horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Nigel",
                                              style: GoogleFonts.rosarivo(
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.star_sharp,
                                              color: Color(0xffFFB800),
                                            ),
                                            const Icon(
                                              Icons.star_sharp,
                                              color: Color(0xffFFB800),
                                            ),
                                            const Icon(
                                              Icons.star_sharp,
                                              color: Color(0xffFFB800),
                                            ),
                                            const Icon(
                                              Icons.star_sharp,
                                              color: Color(0xffFFB800),
                                            ),
                                            const Icon(
                                              Icons.star_sharp,
                                              color: Color(0xffFFB800),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            "Its a great book",
                                            style: GoogleFonts.rosarivo(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                  child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: Text(
                            "Exchange",
                            style: GoogleFonts.rosarivo(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
