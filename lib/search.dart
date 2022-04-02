import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/book_item_card.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var box = BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xffFFFDF8));
  var clr = Color(0xffFFFDF8);
  var ma = EdgeInsets.fromLTRB(15, 3, 19, 9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7efe5),

      body: Stack(
        children: [
          Positioned(
            top: 20.0, left: 5,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(

                      onPressed: () {},
                      child: Icon(
                        Icons.arrow_back_outlined,color: Color(0xffC19280), size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 80, left: 10, right: 0,
            child: Row(
             children: [

               Expanded(
                 flex: 5,
                 child: Container(
                     height: 53, width: 290,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40),
                         color: Color(0xfffafafa)
                     ),

                     padding: EdgeInsets.only(left: 30),

                     child: TextField(
                         decoration: InputDecoration(
                           labelText: 'Search for books',
                           labelStyle: GoogleFonts.rosarivo(
                               fontSize: 18.0,
                               color: Color(0xffcacaca)
                           ),
                         )
                     )
                 ),
            ), //search
               Expanded(
                 flex: 1,

                 child: Container(
                   height: 51,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color: Color(0xffC19280)
                   ),

                   child: TextButton(
                     onPressed: () {},
                     child: Icon(
                       Icons.search, color: Color(0xffE5E5E5),
                     ),
                   ),
                 ),

               ), //search icon

                    ],
                 ),
               ),  //search&icon
          Theme(
            data: Theme.of(context).copyWith(
                scrollbarTheme: ScrollbarThemeData(
                  thumbColor: MaterialStateProperty.all(Color(0xffC19280)),
                  crossAxisMargin: 4,
                )
            ),
            child: Scrollbar(
              isAlwaysShown: true,
              showTrackOnHover: true,
              thickness: 10,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20,170,20,20),
                  child:
                  GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    children: <Widget>[

                      Container(child: BookCard(
                        image: 'assets/images/image.jpg',
                        title: 'Harry Potter and the Philospher Stone',
                        desc: 'nigeldias27',
                      ), margin: ma),
                      Container(child: BookCard(
                        image: 'assets/images/image.jpg',
                        title: 'Harry Potter and the Philospher Stone',
                        desc: 'sammy22',
                      ), margin: ma),
                      Container(child: BookCard(
                        image: 'assets/images/image.jpg',
                        title: 'Harry Potter and the Philospher Stone',
                        desc: 'lohiths26',
                      ), margin: ma),
                      Container(child: BookCard(
                        image: 'assets/images/image.jpg',
                        title: 'Harry Potter and the Philospher Stone',
                        desc: 'smuzzy',
                      ), margin: ma),
                      Container(child: BookCard(
                        image: 'assets/images/image.jpg',
                        title: 'Harry Potter and the Philospher Stone',
                        desc: 'mr.somebody',
                      ), margin: ma),
                      Container(child: BookCard(
                        image: 'assets/images/image.jpg',
                        title: 'Harry Potter and the Philospher Stone',
                        desc: 'doreswamy',
                      ), margin: ma),
                      Container(child: BookCard(
                        image: 'assets/images/image.jpg',
                        title: 'Harry Potter and the Philospher Stone',
                        desc: 'Surabhi',
                      ), margin: ma),

                    ],
                  )
              ),
            ),
          ),  //book images

            ],
         ),
      );
  }
}
