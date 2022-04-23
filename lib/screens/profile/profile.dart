import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:allabtbooks/screens/registration/init.dart';
import 'package:allabtbooks/utils/bottom_app_bar_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int bottom_nav_index = 3;
  String name = '';
  String username = '';
  String email = '';
  String imageURL = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial_info();
  }

  initial_info() async {
    final pref = await SharedPreferences.getInstance();
    FirebaseDatabase.instance
        .ref()
        .child('users/' + pref.getString('username')! + '/')
        .onValue
        .listen((event) async {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final img = await FirebaseStorage.instance
          .ref()
          .child('users/' + pref.getString('username')! + '/profile')
          .getDownloadURL();
      print(img);
      print(data);
      setState(() {
        name = data['name'];
        email = data['email'];
        username = pref.getString('username')!;
        imageURL = img;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7efe5),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottom_nav_index,
        onTap: (int index) {
          setState(() {
            bottom_nav_index = index;
            print(bottom_nav_index);
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
                color: Color(0xffF5D3AD),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
                color: Color(0xffC19280),
              ),
              label: '')
        ],
      ),
      body: username == ''
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 40.0, bottom: 0.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageURL),
                      radius: 80.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 32.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.mali(
                          color: Color(0xfff000000),
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        username,
                        style: GoogleFonts.mali(
                          color: Color(0xfffCACACA),
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 0.0, bottom: 8.0),
                  child: Center(
                    child: Text(
                      email,
                      style: GoogleFonts.mali(
                        color: Color(0xfff838383),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 0.0, bottom: 0),
                  child: Center(
                    child: Text(
                      "Edit",
                      style: GoogleFonts.rosarivo(
                        color: Color(0xfffC19280),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ]),
              Column(children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Icon(Icons.collections_bookmark,
                                size: 25, color: Color(0xfff545454)),
                          ),
                          Text(
                            "Your Collection",
                            style: GoogleFonts.rosarivo(
                              color: Color(0xfff545454),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.chevron_right,
                              color: Color(0xfff545454),
                              size: 25,
                            ),
                          )
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Icon(
                              Icons.local_library,
                              color: Color(0xfff545454),
                              size: 25,
                            ),
                          ),
                          Text(
                            "Recommended",
                            style: GoogleFonts.rosarivo(
                              color: Color(0xfff545454),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.chevron_right,
                              color: Color(0xfff545454),
                              size: 25,
                            ),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Icon(
                              Icons.bookmark,
                              color: Color(0xfff545454),
                              size: 25,
                            ),
                          ),
                          Text(
                            "Want to Read",
                            style: GoogleFonts.rosarivo(
                              color: Color(0xfff545454),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.chevron_right,
                              color: Color(0xfff545454),
                              size: 25,
                            ),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await _auth.signOut();
                    final prefs = await SharedPreferences.getInstance();
                    prefs.remove('username');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InitializerWidget()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Icon(
                              Icons.logout,
                              color: Color(0xfff545454),
                              size: 25,
                            ),
                          ),
                          Text(
                            "Sign out",
                            style: GoogleFonts.rosarivo(
                              color: Color(0xfff545454),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.chevron_right,
                              color: Color(0xfff545454),
                              size: 25,
                            ),
                          ),
                        ]),
                  ),
                )
              ]),
            ]),
    );
  }
}
