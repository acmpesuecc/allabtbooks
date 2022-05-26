import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Final_Details extends StatefulWidget {
  final second_user;
  const Final_Details({Key? key, this.second_user}) : super(key: key);

  @override
  _Final_DetailsState createState() => _Final_DetailsState();
}

class _Final_DetailsState extends State<Final_Details> {
  List content = [];
  @override
  void initState() {
    super.initState();
    _initial_display();
  }

  _initial_display() async {
    final pref = await SharedPreferences.getInstance();
    FirebaseDatabase.instance.ref('users/').get().then((value) {
      var data = Map<String, dynamic>.from(value.value as dynamic);
      var url1 = '';
      var url2 = '';
      data[pref.getString('username')]['collection'].forEach((k, v) {
        if (data[pref.getString('username')]['collection'][k]['name'] ==
            data[pref.getString('username')]['chat'][widget.second_user]
                    ['case2']['books']
                .split('|')[0]) {
          url1 = data[pref.getString('username')]['collection'][k]['url_image'];
        }
      });
      data[widget.second_user]['collection'].forEach((k, v) {
        if (data[widget.second_user]['collection'][k]['name'] ==
            data[widget.second_user]['chat'][pref.getString('username')]
                    ['case2']['books']
                .split('|')[1]) {
          url2 = data[widget.second_user]['collection'][k]['url_image'];
        }
      });
      setState(() {
        content = [
          url1,
          url2,
          data[pref.getString('username')]['chat'][widget.second_user]['case2']
              ['datetime'],
          data[pref.getString('username')]['chat'][widget.second_user]['case2']
              ['loc'],
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7EFE5),
        body: content == []
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 24, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.transparent),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                size: 31,
                                color: Color(0xff545454),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 32.0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(content[0]))),
                                height: 200,
                                width:
                                    MediaQuery.of(context).size.width * 2 / 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(content[1]))),
                                height: 200,
                                width:
                                    MediaQuery.of(context).size.width * 2 / 5,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 48, 8, 8),
                          child: Row(
                            children: [
                              Text(
                                'Time:',
                                style: GoogleFonts.rosarivo(
                                    fontSize: 24,
                                    color: const Color(0xff30011E)),
                              ),
                              Text(
                                content[2],
                                style: GoogleFonts.rosarivo(
                                    fontSize: 14,
                                    color: const Color(0xff545454)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8.0, 8, 8),
                          child: Row(
                            children: [
                              Text(
                                'Location:',
                                style: GoogleFonts.rosarivo(
                                    fontSize: 24,
                                    color: const Color(0xff30011E)),
                              ),
                              TextButton(
                                onPressed: () {
                                  String url =
                                      'https://www.google.com/maps/search/?api=1&query=' +
                                          content[3].split(',')[0] +
                                          '%2C' +
                                          content[3].split(',')[1];
                                  _launchUrl(Uri.parse(url));
                                  //https://www.google.com/maps/search/?api=1&query=47.5951518%2C-122.3316393
                                },
                                style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.transparent),
                                ),
                                child: Text(
                                  'See on google maps',
                                  style: GoogleFonts.rosarivo(
                                      fontSize: 14,
                                      color: const Color(0xff545454)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextButton(
                        onPressed: () async {
                          final pref = await SharedPreferences.getInstance();
                          FirebaseDatabase.instance
                              .ref('users/' +
                                  widget.second_user +
                                  '/chat/' +
                                  pref.getString('username')! +
                                  '/case2')
                              .update({'arrived': 'true'});
                        },
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                'ARRIVED',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rosarivo(
                                    fontSize: 18, color: Colors.white),
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

  void _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
