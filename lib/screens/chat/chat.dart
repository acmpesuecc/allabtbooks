import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:allabtbooks/utils/bottom_app_bar_navigation.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int bottom_nav_index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext ctx, int i) {
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
                              'https://image.cnbcfm.com/api/v1/image/106965909-1635265647645-gettyimages-1229892823-AFP_8WA6CM.jpeg?v=1640804100&w=740&h=416',
                              fit: BoxFit.cover,
                              height: 90,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lohith",
                                  style: GoogleFonts.mali(
                                      fontSize: 24,
                                      color: Color(0xffACACAC),
                                      fontWeight: FontWeight.w300)),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
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
            /*  return InkWell(
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
                              'https://image.cnbcfm.com/api/v1/image/106965909-1635265647645-gettyimages-1229892823-AFP_8WA6CM.jpeg?v=1640804100&w=740&h=416',
                              fit: BoxFit.cover,
                              height: 90,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text("Lohith",
                              style: GoogleFonts.mali(
                                  fontSize: 24, fontWeight: FontWeight.w300)))
                    ],
                  ),
                  Container(
                    color: const Color(0xffc4c4c4),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  )
                ],
              ),
            ); */
          }),
    );
  }
}
