import 'dart:async';

import 'package:allabtbooks/screens/registration/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:allabtbooks/widget/book_item_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBooks extends StatefulWidget {
  final page, username;
  const ProfileBooks({Key? key, this.page, this.username}) : super(key: key);

  @override
  _ProfileBooksState createState() => _ProfileBooksState();
}

class _ProfileBooksState extends State<ProfileBooks> {
  List content = [];
  String? username = '';
  var loading = true;
  late StreamSubscription stream;
  @override
  void initState() {
    super.initState();
    initial_display();
  }

  initial_display() async {
    final pref = await SharedPreferences.getInstance();
    stream = FirebaseDatabase.instance
        .ref('users/' + widget.username + '/' + widget.page)
        .onValue
        .listen((event) {
      try {
        username = pref.getString('username');
        if (widget.username == username && widget.page == 'collection') {
          content = ["add"];
        } else {
          content = [];
        }
        print(content);
        var data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
        setState(() {
          username = pref.getString('username');
          data.forEach((key, value) {
            content.add([key, data[key]]);
          });
          loading = false;
        });
      } catch (e) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(content);
    return Scaffold(
      backgroundColor: const Color(0xffF7EFE5),
      body: SafeArea(
        child: loading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : content.length == 0
                ? Center(
                    child: Text(
                      'No books were found',
                      style: GoogleFonts.rosarivo(
                          color: Color(0xffC19280), fontSize: 14),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: content.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          if (content[index] == "add") {
                            return Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(13, 17, 17, 11),
                              child: InkWell(
                                onTap: () async {
                                  var loc = await Location().getLocation();
                                  String latlong =
                                      loc.latitude.toString() + ',' + loc.longitude.toString();
                                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>Collection(username: widget.username,loc: latlong,next: 'collection',)));
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFFDF8),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 8,
                                            offset: Offset(0, 4),
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40,
                                        color: Color(0xffD1D1D1),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(5, 9, 9, 3),
                              child: InkWell(
                                onLongPress: widget.username == username
                                    ? () {
                                        FirebaseDatabase.instance
                                            .ref('users/' +
                                                widget.username +
                                                '/' +
                                                widget.page +
                                                '/' +
                                                content[index][0])
                                            .remove();
                                      }
                                    : () {},
                                child: BookCard(
                                  image: content[index][1]['url_image'],
                                  title: content[index][1]['name'],
                                  desc: content[index][1]['author'],
                                ),
                              ),
                            );
                          }
                        }),
                  ),
      ),
    );
  }

  @override
  void deactivate() {
    stream.cancel();
    super.deactivate();
  }
}
