import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:allabtbooks/screens/homep.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendRequest extends StatefulWidget {
  final username;
  const FriendRequest({Key? key, this.username}) : super(key: key);

  @override
  State<FriendRequest> createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequest> {
  TextEditingController friend_username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/friendreq.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 24, 16, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 48, 8, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Friend Request',
                            style: GoogleFonts.waitingForTheSunrise(
                                fontSize: 40, color: Color(0xffFFEDD1)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 8, 8, 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Search for friends to exchange books with',
                              style: GoogleFonts.rosarivo(
                                fontSize: 17,
                                color: Color(0xffFFEDD1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8.0, 8, 8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: friend_username,
                              style: TextStyle(color: Color(0xffFFEDD1)),
                              decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffFFEDD1))),
                                  labelText: "Username",
                                  labelStyle: GoogleFonts.rosarivo(
                                      fontSize: 16, color: Color(0xffFFEDD1))),
                            ),
                          ),
                          Expanded(
                              child: TextButton(
                            onPressed: add_username,
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent),
                            ),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: const Offset(0, 4))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    'ADD',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.rosarivo(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                )),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('username', widget.username);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home(
                                    username: widget.username,
                                  )));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                    ),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4))
                            ],
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'NEXT',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rosarivo(
                                fontSize: 22, color: Colors.black),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  add_username() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    ref.child('users/').onValue.listen((event) async {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      print(data.keys);
      if (friend_username.text != '') {
        if (data.keys.contains(friend_username.text)) {
          await ref
              .child('users/' + widget.username + '/' + 'friend_req')
              .update({friend_username.text: 0});
          await ref
              .child('users/' + friend_username.text + '/' + 'friend_req')
              .update({widget.username: 0});
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Friend request sent')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Username does not exist')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please enter the username to add')));
      }
    });
  }
}
