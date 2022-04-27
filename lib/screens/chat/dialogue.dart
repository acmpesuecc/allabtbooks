import 'dart:async';

import 'package:allabtbooks/screens/chat/books_involved.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Dialogue extends StatefulWidget {
  final second_user;
  const Dialogue({Key? key, this.second_user}) : super(key: key);

  @override
  _DialogueState createState() => _DialogueState();
}

class _DialogueState extends State<Dialogue> {
  List content = [];
  var loading = true;
  late StreamSubscription stream;
  @override
  void initState() {
    // TODO: Check if when clicking on google maps button it opens google maps and when clicking on remove and add button it does the same functionality
    super.initState();
    initialdisplay();
  }

  initialdisplay() async {
    final pref = await SharedPreferences.getInstance();
    stream = FirebaseDatabase.instance
        .ref('users/' +
            pref.getString('username')! +
            '/chat/' +
            widget.second_user)
        .orderByChild('timestamp')
        .onValue
        .listen((event) {
      content = [];
      var data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      setState(() {
        loading = false;
        data.forEach((key, value) {
          if (key != 'case2') {
            content.add([key, data[key]]);
          }
        });
        print(content);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle 37.png"),
                  fit: BoxFit.cover)),
          child: loading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffA2A2A2)),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Color(0xff565656),
                              size: 31,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                Books_involved(
                                                  second_user:
                                                      widget.second_user,
                                                )));
                                  },
                                  style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Color(0xffA2A2A2)),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xff565656),
                                    size: 31,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Color(0xffA2A2A2))),
                                child: Icon(
                                  Icons.delete,
                                  color: Color(0xff565656),
                                  size: 31,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: content.length == 0
                              ? Center(
                                  child: Text(
                                    'No chats have been initiated',
                                    style: GoogleFonts.rosarivo(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: content.length,
                                  itemBuilder: (BuildContext ctx, int i) {
                                    if (content[i][1]['issue'] ==
                                        widget.second_user) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  15 /
                                                  20,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffF7EFE5)
                                                      .withOpacity(0.85),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(21.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Place:",
                                                          style: GoogleFonts
                                                              .rosarivo(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        TextButton(
                                                          style: ButtonStyle(
                                                            padding: MaterialStateProperty
                                                                .resolveWith(
                                                                    (states) =>
                                                                        EdgeInsets
                                                                            .zero),
                                                            overlayColor:
                                                                MaterialStateColor
                                                                    .resolveWith(
                                                              (states) => Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            String url = 'https://www.google.com/maps/search/?api=1&query=' +
                                                                content[i][1][
                                                                            'loc']
                                                                        .split(
                                                                            ',')[
                                                                    0] +
                                                                '%2C' +
                                                                content[i][1]
                                                                        ['loc']
                                                                    .split(
                                                                        ',')[1];
                                                            _launchUrl(
                                                                Uri.parse(url));
                                                            //https://www.google.com/maps/search/?api=1&query=47.5951518%2C-122.3316393
                                                          },
                                                          child: Text(
                                                            "See on google maps",
                                                            style: GoogleFonts.rosarivo(
                                                                fontSize: 14,
                                                                color: const Color(
                                                                    0xff545454)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Time:",
                                                          style: GoogleFonts
                                                              .rosarivo(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          content[i][1]
                                                              ['datetime'],
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
                                                          style: GoogleFonts
                                                              .rosarivo(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            content[i][1]
                                                                ['books'],
                                                            style: GoogleFonts.rosarivo(
                                                                fontSize: 14,
                                                                color: const Color(
                                                                    0xff545454)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              final pref =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref('users/' +
                                                                      pref.getString(
                                                                          'username')! +
                                                                      '/chat/' +
                                                                      widget
                                                                          .second_user)
                                                                  .set({
                                                                'case2': {
                                                                  'books': content[
                                                                          i][1]
                                                                      ['books'],
                                                                  'datetime':
                                                                      content[i]
                                                                              [
                                                                              1]
                                                                          [
                                                                          'datetime'],
                                                                  'timestamp':
                                                                      content[i]
                                                                              [
                                                                              1]
                                                                          [
                                                                          'timestamp'],
                                                                  'loc': content[
                                                                          i][1]
                                                                      ['loc'],
                                                                  'arrived':
                                                                      'false'
                                                                }
                                                              });
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref('users/' +
                                                                      widget
                                                                          .second_user +
                                                                      '/chat/' +
                                                                      pref.getString(
                                                                          'username')!)
                                                                  .set({
                                                                'case2': {
                                                                  'books': content[
                                                                          i][1]
                                                                      ['books'],
                                                                  'datetime':
                                                                      content[i]
                                                                              [
                                                                              1]
                                                                          [
                                                                          'datetime'],
                                                                  'timestamp':
                                                                      content[i]
                                                                              [
                                                                              1]
                                                                          [
                                                                          'timestamp'],
                                                                  'loc': content[
                                                                          i][1]
                                                                      ['loc'],
                                                                  'arrived':
                                                                      'false'
                                                                }
                                                              });
                                                            },
                                                            style: ButtonStyle(
                                                              overlayColor: MaterialStateColor
                                                                  .resolveWith(
                                                                      (states) =>
                                                                          Color(
                                                                              0xffC6E2A5)),
                                                            ),
                                                            child: const Icon(
                                                                Icons.done,
                                                                color: Color(
                                                                    0xffA1CF6B)),
                                                          ),
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              final pref =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref('users/' +
                                                                      pref.getString(
                                                                          'username')! +
                                                                      '/chat/' +
                                                                      widget
                                                                          .second_user +
                                                                      '/' +
                                                                      content[i]
                                                                          [0])
                                                                  .remove();
                                                              FirebaseDatabase
                                                                  .instance
                                                                  .ref('users/' +
                                                                      widget
                                                                          .second_user +
                                                                      '/chat/' +
                                                                      pref.getString(
                                                                          'username')! +
                                                                      '/' +
                                                                      content[i]
                                                                          [0])
                                                                  .remove();
                                                            },
                                                            style: ButtonStyle(
                                                              overlayColor: MaterialStateColor
                                                                  .resolveWith(
                                                                      (states) =>
                                                                          Color(
                                                                              0xffE36874)),
                                                            ),
                                                            child: const Icon(
                                                                Icons.close,
                                                                color: Color(
                                                                    0xffD62839)),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  15 /
                                                  20,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffF5D3AD)
                                                      .withOpacity(0.95),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(21.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Place:",
                                                          style: GoogleFonts
                                                              .rosarivo(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        TextButton(
                                                          style: ButtonStyle(
                                                            padding: MaterialStateProperty
                                                                .resolveWith(
                                                                    (states) =>
                                                                        EdgeInsets
                                                                            .zero),
                                                            overlayColor:
                                                                MaterialStateColor
                                                                    .resolveWith(
                                                              (states) => Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            String url = 'https://www.google.com/maps/search/?api=1&query=' +
                                                                content[i][1][
                                                                            'loc']
                                                                        .split(
                                                                            ',')[
                                                                    0] +
                                                                '%2C' +
                                                                content[i][1]
                                                                        ['loc']
                                                                    .split(
                                                                        ',')[1];
                                                            _launchUrl(
                                                                Uri.parse(url));
                                                            //https://www.google.com/maps/search/?api=1&query=47.5951518%2C-122.3316393
                                                          },
                                                          child: Text(
                                                            "See on google maps",
                                                            style: GoogleFonts.rosarivo(
                                                                fontSize: 14,
                                                                color: const Color(
                                                                    0xff545454)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Time:",
                                                          style: GoogleFonts
                                                              .rosarivo(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          content[i][1]
                                                              ['datetime'],
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
                                                          style: GoogleFonts
                                                              .rosarivo(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            content[i][1]
                                                                ['books'],
                                                            style: GoogleFonts.rosarivo(
                                                                fontSize: 14,
                                                                color: const Color(
                                                                    0xff545454)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
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

  void _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    stream.cancel();
    super.deactivate();
  }
}
