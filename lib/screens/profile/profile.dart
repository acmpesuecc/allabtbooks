import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:allabtbooks/screens/registration/init.dart';
import 'package:allabtbooks/utils/bottom_app_bar_navigation.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int bottom_nav_index = 3;
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
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(children: [
          Padding(
            padding:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 40.0, bottom: 0.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.cnbcfm.com/api/v1/image/106965909-1635265647645-gettyimages-1229892823-AFP_8WA6CM.jpeg?v=1640804100&w=740&h=416'),
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
                  "Nigel Dias",
                  style: GoogleFonts.mali(
                    color: Color(0xfff000000),
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  " nigeldias27",
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
                "9900423687",
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
