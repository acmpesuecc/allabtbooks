import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/book_item_card.dart';
import 'package:allabtbooks/models/bookcarddata.dart';
import 'package:allabtbooks/utils/bottom_app_bar_navigation.dart';
import 'package:allabtbooks/screens/registration/personal_info.dart';

class Home extends StatefulWidget {
  final username;
  const Home({Key? key, this.username}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //var box = BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xffFFFDF8));
  int active_index = 0;
  int bottom_nav_index = 0;
  var ma = const EdgeInsets.fromLTRB(15, 3, 19, 9);
  var sty = GoogleFonts.waitingForTheSunrise(
      fontSize: 20, color: const Color(0xff000000));

  @override
  Widget build(BuildContext context) {
    print(widget.username);
    if (widget.username == null) {
      return PersonalInfo();
    } else {
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
                    color: Color(0xffC19280),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Color(0xffF5D3AD),
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
        body: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 265,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/book_stack.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40)),
                      ),
                    ),
                    Container(
                      color: const Color(0xfff7efe5),
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                    ),
                  ],
                ),
                //book stack image
                Positioned(
                  top: 40.0,
                  left: 30.0,
                  right: 10.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('AllAbtBooks',
                              style: GoogleFonts.rosarivo(
                                  fontSize: 24.0,
                                  color: const Color(0xff30011e))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  print('add friend');
                                },
                                icon: const Icon(
                                  Icons.add_outlined,
                                  color: Color(0xff30011E),
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  print('notifications');
                                },
                                icon: const Icon(
                                  Icons.add_alert_rounded,
                                  color: Color(0xff30011E),
                                  size: 28,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ), //AllAbtBooks

                Positioned(
                  bottom: 5,
                  left: 30,
                  right: 30,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Hi',
                            style: GoogleFonts.crimsonText(
                              fontSize: 36.0,
                              color: const Color(0xff30011e),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nigel!',
                            style: GoogleFonts.crimsonText(
                                fontSize: 48.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff30011e)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: const Color(0xfffafafa),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 4),
                                        blurRadius: 4)
                                  ]),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 8),
                                child: TextField(
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(8),
                                      isDense: true,
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffcacaca))),
                                      label: Text(
                                        'Search for Books',
                                        style: GoogleFonts.rosarivo(
                                            fontSize: 18.0,
                                            color: const Color(0xffcacaca)),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent),
                              padding: MaterialStateProperty.resolveWith(
                                  (states) => EdgeInsets.zero),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffC19280),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xffE5E5E5),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ), //hi nigel, search
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                height: 55,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  //genres list has been imported from models/bookcarddata.dart
                  itemBuilder: (context, int index) {
                    if (active_index == index) {
                      return Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    genres[index],
                                    //genres list has been imported from models/bookcarddata.dart
                                    style: sty,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 2,
                                    color: const Color(0xffC19280),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                active_index = index;
                              });
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                genres[index],
                                //genres list has been imported from models/bookcarddata.dart
                                style: sty,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height - 415,
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: bookitem.length,
                  //Book item list has been imported from models/bookcarddata.dart
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return Container(
                      child: BookCard(
                        image: bookitem[index][0],
                        //Book item list has been imported from models/bookcarddata.dart
                        title: bookitem[index][1],
                        desc: bookitem[index][2],
                      ),
                      margin: ma,
                    );
                  }),
            ),
          ],
        ),
      );
    }
  } // Build
} // Class
