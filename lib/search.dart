import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
            ],
         ),
      );
  }
}
