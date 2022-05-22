import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/bottom_app_bar_navigation.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  int bottom_nav_index=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7efe5),
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
                  color: Color(0xffC19280),
                ),
                label: " "),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_outlined,
                  color: Color(0xffF5D3AD),
                ),
                label: " "),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.perm_identity,
                  color: Color(0xffF5D3AD),
                ),
                label: " "),
          ]),
      body: SizedBox(width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
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
          ],),
        ),
      ),
    );
  }
}
