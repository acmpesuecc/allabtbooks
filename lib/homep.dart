import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/book_item_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //var box = BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xffFFFDF8));
  //var clr = Color(0xffFFFDF8);
  var ma = EdgeInsets.fromLTRB(15, 3, 19, 9);
  var sty = GoogleFonts.waitingForTheSunrise(fontSize: 20, color: Color(0xff000000));

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7efe5),
      bottomNavigationBar: BottomNavigationBar(items:[
        BottomNavigationBarItem(icon: Icon(Icons.menu_book, color: Color(0xffC19280),),label:" "),
        BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Color(0xffF5D3AD),),label:" "),
        BottomNavigationBarItem(icon: Icon(Icons.chat_outlined, color: Color(0xffF5D3AD),),label:" "),
        BottomNavigationBarItem(icon: Icon(Icons.perm_identity, color: Color(0xffF5D3AD),),label:" "),
      ]),

      body: Stack(
        children: [
            Container(
            width: MediaQuery.of(context).size.width,
            height: 265,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/book_stack.png'),
                    fit: BoxFit.cover
                ),

                    borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)
            ),
          ),
        ),  //book stack image
            Positioned(
            top: 30.0, left: 30.0, right: 0.0,
            child: Column(
              children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('AllAbtBooks',
                  style: GoogleFonts.rosarivo(
                  fontSize: 24.0,
                  color: Color(0xff30011e)
                  ))
    ],
            ),
        ],
    ),
    ),  //AllAbtBooks
            Positioned(
            top: 20.0, left: 0, right: 35.0,
            child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(

                        onPressed: () {
                          print('add friend');
                        },
                        child: Icon(
                            Icons.add_outlined,color: Color(0xff30011E), size: 30,
                ),
                  ),
                  ],
                 ),
                ],
            ),
            ),  //plus icon
            Positioned(
            top: 20.0, left: 0, right: 5.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('notifications');
                      },
                      child: Icon(
                        Icons.add_alert_rounded,color: Color(0xff30011E), size: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),  //bell icon
            Positioned(
                   top: 105, left: 30, right: 30,
                    child: Column(
                        children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                    Text('Hi',
                                      style: GoogleFonts.crimsonText(
                                        fontSize: 36.0,
                                        color: Color(0xff30011e),
                                    ),),

                                  ],),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nigel!',
                                  style: GoogleFonts.crimsonText(
                                      fontSize: 48.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff30011e)
                                  ),),
                              ],
                            ),
                            Row(

                              children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                    height: 53,
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
                                        ), //),
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

                              ),
                      ],),

    ],
                    ),
                    ),  //hi nigel, search
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
                thickness: 13,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20,335,20,15),
                    child:
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      children: <Widget>[
                        //color: Color(0xffFFFDF8),

                        Container(child: BookCard(
                          image: 'assets/images/image.jpg',
                          title: 'Harry Potter and the Philospher Stone',
                          desc: 'nigeldias27',
                        ), margin: ma),
                        Container(child: BookCard(
                          image: 'assets/images/angel.jpg',
                          title: 'Angel and Demons',
                          desc: 'nigeldias27',
                        ), margin: ma),
                        Container(child: BookCard(
                          image: 'assets/images/coho.jpg',
                          title: 'Reminders of Him',
                          desc: 'lohiths26',
                        ), margin: ma),
                        Container(child: BookCard(
                          image: 'assets/images/6ofcrows.jpg',
                          title: 'Six of Crows',
                          desc: 'sammy22',
                        ), margin: ma),
                        Container(child: BookCard(
                          image: 'assets/images/elonmusk.jpg',
                          title: 'Elon Musk',
                          desc: 'nigeldias27',
                        ), margin: ma),
                        Container(child: BookCard(
                          image: 'assets/images/angel.jpg',
                          title: 'Angel and Demons',
                          desc: 'sammy22',
                        ), margin: ma),
                        Container(child: BookCard(
                          image: 'assets/images/coho.jpg',
                          title: 'Reminders of Him',
                          desc: 'lohiths26',
                        ), margin: ma),
                        Container(child: BookCard(
                          image: 'assets/images/6ofcrows.jpg',
                          title: 'Six of Crows',
                          desc: 'sammy22',
                        ), margin: ma),



                      ],
                    )
                ),
              ),
            ),  //book images
            Padding(
              padding: EdgeInsets.fromLTRB(30,2,20,80),
              child:
              ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[

                    Row(
                      children: [

                        Text('Thriller',
                            style: sty,
                        ),
                        SizedBox(width: 25,),
                        Text('Romance',
                            style: sty,
                        ),
                        SizedBox(width: 25,),
                        Text('Fantasy',
                            style: sty,
                        ),
                        SizedBox(width: 25,),
                        Text('SciFi',
                            style: sty,
                        ),
                        SizedBox(width: 25,),
                        Text('Young Adult',
                            style: sty,
                        ),
                        SizedBox(width: 25,),
                        Text('Autobiography',
                            style: sty,
                        ),
                        SizedBox(width: 25,),
                        Text('Classics',
                          style: sty,
                        ),
                        SizedBox(width: 25,),



                      ]
                  )
                ],
              )
          ),  //genre names

        ],
      ),
    );
  } // Build
} // Class





