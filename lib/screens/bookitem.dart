import 'package:allabtbooks/screens/chat/chat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Book extends StatefulWidget {
  final data;
  const Book({Key? key, this.data}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.data['url_image']),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9),
                  BlendMode.luminosity,
                )),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 110,
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 27,
                            color: Color(0xff000000),
                          ),
                        ),
                        Row(
                          children: [
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
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 176,
                        width: 123,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: (NetworkImage(widget.data['url_image'])),
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
                        padding: const EdgeInsets.fromLTRB(0, 36, 5, 8),
                        child: Text(
                          widget.data['name'],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mali(
                              fontSize: 32, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Text(
                        widget.data['author'],
                        style: GoogleFonts.rosarivo(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      ),
                      Text(
                        widget.data['isbn_username'].split('&')[1],
                        style: GoogleFonts.rosarivo(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 16.0, 0, 0),
                              child: Text(
                                "Reviews",
                                style: GoogleFonts.mali(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding: const EdgeInsets.only(top: 10.0),
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
                      ),
                      Padding(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding: const EdgeInsets.only(top: 10.0),
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
                      ),
                      Padding(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding: const EdgeInsets.only(top: 10.0),
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
                      ),
                      Padding(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding: const EdgeInsets.only(top: 10.0),
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
                      )
                    ],
                  ),
                ]),
              ),
              TextButton(
                onPressed: exchange,
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
            ],
          ),
        ),
      ),
    );
  }

  exchange() async {
    final pref = await SharedPreferences.getInstance();
    FirebaseDatabase.instance
        .ref('users/' +
            pref.getString('username')! +
            '/chat/' +
            widget.data['isbn_username'].split('&')[1] +
            '/case2/')
        .set({'empty': true});
    await FirebaseDatabase.instance
        .ref('users/' +
            widget.data['isbn_username'].split('&')[1] +
            '/chat/' +
            pref.getString('username')! +
            '/case2/')
        .set({'empty': true});
    Navigator.push(context, MaterialPageRoute(builder: (builder) => Chat()));
  }
}
