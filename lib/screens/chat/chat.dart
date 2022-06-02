import 'dart:async';

import 'package:allabtbooks/screens/chat/dialogue.dart';
import 'package:allabtbooks/screens/chat/final_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:allabtbooks/utils/bottom_app_bar_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int bottom_nav_index = 2;
  List content = [];
  late StreamSubscription stream;
  var loading = true;
  @override
  void initState() {
    super.initState();
    initial_process();
  }

  initial_process() async {
    final pref = await SharedPreferences.getInstance();
    stream =
        FirebaseDatabase.instance.ref('users').onValue.listen((event) async {
      var data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      content = [];
      if(data[pref.getString('username')!]['chat']!=null){
        await data[pref.getString('username')!]['chat']
            .forEach((key, value) async {
          var img = await FirebaseStorage.instance
              .ref()
              .child('users/' + key + '/profile')
              .getDownloadURL();
          var arr = '';
          try {
            data[pref.getString('username')!]['chat'][key]['case2']['arrived'] ==
                null
                ? false
                : true;
            arr = data[pref.getString('username')!]['chat'][key]['case2']
            ['arrived'];
          } catch (e) {
            arr = '';
          }
          content.add([
            key, img,
            arr //,data[key]['case2']['arrived'] == null ? false : true
          ]);
          setState(() {
            loading = false;
            content = content;
          });
        });
      }
      //TODO: Make sure this works when a chat user is created
      else{
        setState((){
          loading=false;
          content=content;
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottom_nav_index,
        onTap: (int index) {
          setState(() {
            bottom_nav_index = index;
          });
          bottom_navigation(index, context);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book,
                color: Color(0xffF5D3AD),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Color(0xffF5D3AD),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Color(0xffC19280),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
                color: Color(0xffF5D3AD),
              ),
              label: '')
        ],
      ),
      backgroundColor: const Color(0xfff7efe5),
      body: loading == true
          ? Center(
              child: Lottie.asset("assets/load.json", width: 200, height: 200),
            )
          : content.length == 0
              ? Center(
                  child: Text(
                    "No chats have been created",
                    style: GoogleFonts.rosarivo(
                        color: Color(0xffC19280), fontSize: 14),
                  ),
                )
              : ListView.builder(
                  itemCount: content.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    if (content[i][2] == "true") {
                      return InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(300),
                                      child: Image.network(
                                        content[i][1],
                                        fit: BoxFit.cover,
                                        height: 90,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(content[i][0],
                                            style: GoogleFonts.mali(
                                                fontSize: 24,
                                                color: Color(0xffACACAC),
                                                fontWeight: FontWeight.w300)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Arrived at the meeting point',
                                            style: GoogleFonts.rosarivo(
                                                fontSize: 14,
                                                color: Color(0xffACACAC),
                                                fontWeight: FontWeight.w300),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                            Container(
                              color: const Color(0xffc4c4c4),
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                            )
                          ],
                        ),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => content[i][2] == 'false'
                                      ? Final_Details(
                                          second_user: content[i][0],
                                        )
                                      : Dialogue(
                                          second_user: content[i][0],
                                        )));
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(300),
                                      child: Image.network(
                                        content[i][1],
                                        fit: BoxFit.cover,
                                        height: 90,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(content[i][0],
                                        style: GoogleFonts.mali(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w300)))
                              ],
                            ),
                            Container(
                              color: const Color(0xffc4c4c4),
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                            )
                          ],
                        ),
                      );
                    }
                  }),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    stream.cancel();
    super.deactivate();
  }
}
