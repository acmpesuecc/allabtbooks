import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../utils/bottom_app_bar_navigation.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  int bottom_nav_index=1;
  bool section_activity=true;
  List friend_req = [];
  List activity = [];
  late StreamSubscription stream;
  late StreamSubscription stream2;

  @override
  void initState() {
    super.initState();
    _friend_req_info();
    _activity_info();
  }
  _friend_req_info() async {
    final pref  = await SharedPreferences.getInstance();
    stream=FirebaseDatabase.instance.ref('users/'+pref.getString('username')!+'/friend_req').onValue.listen((event) {
      var data = Map.from(event.snapshot.value as Map);
      friend_req=[];
      setState((){
        data.forEach((key, value) {
          friend_req.add(key);
        });
      });
    });
    setState((){friend_req=friend_req;});
  }
  _activity_info() async {
    final pref = await SharedPreferences.getInstance();
    stream2=FirebaseDatabase.instance.ref('users/'+pref.getString('username')!+'/activity').orderByChild('timedate').onValue.listen((event) {
      activity=[];
      setState((){

        event.snapshot.children.forEach((element) {
          activity.add(element.value);
        });
      });
    });

  }

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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                Expanded(child: TextButton(onPressed: (){
                  setState((){
                    section_activity=true;
                  });
                },style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states) => Color(0xffdbbfb5)),backgroundColor:MaterialStateProperty.resolveWith((states) =>section_activity? Color(0xffC19280):Colors.transparent) ), child: Text('Activity',style: GoogleFonts.mali(color:section_activity? Color(0xffFFFFFF):Color(0xffC19280)),))),
                Expanded(child: TextButton(onPressed: (){
                  setState((){
                    section_activity=false;
                  });
                },style: ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith((states) =>section_activity? Colors.transparent:Color(0xffC19280)),overlayColor: MaterialStateProperty.resolveWith((states) => Color(0xffdbbfb5))), child: Text('Friend Requests',style: GoogleFonts.mali(color: section_activity?Color(0xffC19280):Color(0xffFFFFFF)),)))
              ],),
            ),
            Container(height: MediaQuery.of(context).size.height-130,
              child: ListView.builder(shrinkWrap: true,itemCount: section_activity?activity.length:friend_req.length,itemBuilder: (context,int i){
               if(section_activity){
                 return Padding(
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
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Expanded(
                               child: Text(
                                 activity[activity.length-i-1]['type']=='collection'?activity[activity.length-i-1]['person']+' added a new book':activity[activity.length-i-1]['type']=='recommended'?activity[activity.length-i-1]['person']+' has recommended a book':activity[activity.length-i-1]['type']=='interested'?activity[activity.length-i-1]['person']+' is interested in':'',
                                 style: GoogleFonts.rosarivo(
                                   fontSize: 18,
                                   fontWeight: FontWeight.normal,
                                   color: Color(0xffac6d55)
                                 ),
                               ),
                             ),
                             Text(DateFormat.d().format(DateFormat('yy-MM-dd hh:mm:ss').parse(activity[activity.length-i-1]['timedate'])).toString()+'/'+DateFormat.M().format(DateFormat('yy-MM-dd hh:mm:ss').parse(activity[activity.length-i-1]['timedate'])).toString()+'/'+DateFormat.y().format(DateFormat('yy-MM-dd hh:mm:ss').parse(activity[activity.length-i-1]['timedate'])).toString()[2]+DateFormat.y().format(DateFormat('yy-MM-dd hh:mm:ss').parse(activity[activity.length-i-1]['timedate'])).toString()[3]+' '+DateFormat.jm().format(DateFormat('yy-MM-dd hh:mm:ss').parse(activity[activity.length-i-1]['timedate'])).toString(),style: GoogleFonts.rosarivo(fontSize: 8,color: Colors.grey),)
                           ],
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 10.0),
                           child: Text(
                             activity[activity.length-i-1]['name'].toString(),
                             style: GoogleFonts.rosarivo(
                               fontSize: 10,
                               fontWeight: FontWeight.normal,
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
               );}
                else{
                 return Padding(
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
                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             friend_req[i],
                             style: GoogleFonts.rosarivo(
                               fontSize: 18,
                               fontWeight: FontWeight.normal,
                             ),
                           ),
                           Row(children: [
                             TextButton(
                               onPressed:
                                   () async {
                                     final pref = await SharedPreferences.getInstance();
                                     FirebaseDatabase.instance.ref('users/'+pref.getString('username')!+'/friend_req/'+friend_req[i]).remove();
                                     FirebaseDatabase.instance.ref('users/'+pref.getString('username')!+'/friend/').update(
                                         {friend_req[i]:0});
                                     FirebaseDatabase.instance.ref('users/'+friend_req[i]+'/friend/').update(
                                         {pref.getString('username')!:0});

                                   },
                               style: ButtonStyle(
                                 overlayColor: MaterialStateColor
                                     .resolveWith(
                                         (states) =>
                                         Color(
                                             0xffC6E2A5)),
                               ),
                               child: const Icon(
                                   Icons.done,
                                   color: Color(
                                       0xffA1CF6B)),
                             ),
                             TextButton(
                               onPressed:
                                   () async {
                                 final pref = await SharedPreferences.getInstance();
                                 FirebaseDatabase.instance.ref('users/'+pref.getString('username')!+'/friend_req/'+friend_req[i]).remove();
                         },
                               style: ButtonStyle(
                                 overlayColor: MaterialStateColor
                                     .resolveWith(
                                         (states) =>
                                         Color(
                                             0xffE36874)),
                               ),
                               child: const Icon(
                                   Icons.close,
                                   color: Color(
                                       0xffD62839)),
                             )
                           ],)
                         ],
                       ),
                     ),
                   ),
                 );
               }
              }),
            ),

          ],),
        ),
      ),
    );
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    stream.cancel();
    stream2.cancel();
    super.deactivate();
  }
}
