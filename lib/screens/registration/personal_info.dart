import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'collection.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  File? files = null;
  final username = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final fav_genre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/personal_info.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 24, 16, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 140,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 145,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 48, 8, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personal Info',
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
                                  Text(
                                    'Tell us more about yourself',
                                    style: GoogleFonts.rosarivo(
                                      fontSize: 17,
                                      color: Color(0xffFFEDD1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.transparent),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        final picker = await FilePicker.platform
                                            .pickFiles();
                                        final path = picker?.files.single.path;
                                        setState(() {
                                          files = File(path!);
                                        });
                                      },
                                      child: files == null
                                          ? Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              child: Icon(
                                                Icons.person_add,
                                                color: Colors.black,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    9,
                                              ),
                                            )
                                          : CircleAvatar(
                                              radius: 80,
                                              backgroundImage:
                                                  FileImage(files!),
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
                                    child: TextField(
                                      controller: name,
                                      style:
                                          TextStyle(color: Color(0xffFFEDD1)),
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffFFEDD1))),
                                          labelText: "Name",
                                          labelStyle: GoogleFonts.rosarivo(
                                              fontSize: 16,
                                              color: Color(0xffFFEDD1))),
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
                                    child: TextField(
                                      controller: username,
                                      style:
                                          TextStyle(color: Color(0xffFFEDD1)),
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffFFEDD1))),
                                          labelText: "Username",
                                          labelStyle: GoogleFonts.rosarivo(
                                              fontSize: 16,
                                              color: Color(0xffFFEDD1))),
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
                                    child: TextField(
                                      controller: email,
                                      style:
                                          TextStyle(color: Color(0xffFFEDD1)),
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffFFEDD1))),
                                          labelText: "Email",
                                          labelStyle: GoogleFonts.rosarivo(
                                              fontSize: 16,
                                              color: Color(0xffFFEDD1))),
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
                                    child: TextField(
                                      controller: fav_genre,
                                      style:
                                          TextStyle(color: Color(0xffFFEDD1)),
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffFFEDD1))),
                                          labelText: "Favourite Genre",
                                          labelStyle: GoogleFonts.rosarivo(
                                              fontSize: 16,
                                              color: Color(0xffFFEDD1))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextButton(
                    onPressed: personal_added,
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

  personal_added() async {
    var loc = await Location().getLocation();
    DatabaseReference ref1 = FirebaseDatabase.instance.ref();
    ref1.child('users/').onValue.listen((event) async {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      print(data.keys);
      if (data.keys.contains(username.text)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Username already exists')));
      } else {
        if (username.text != '' &&
            name.text != '' &&
            email.text != '' &&
            fav_genre.text != '' &&
            files != null) {
          DatabaseReference ref =
              FirebaseDatabase.instance.ref('users/' + username.text);
          String latlong =
              loc.latitude.toString() + ',' + loc.longitude.toString();
          ref.set({
            'email': email.text,
            'name': name.text,
            'fav_genre': fav_genre.text,
            'location': latlong
          });
          FirebaseStorage.instance
              .ref('users/' + username.text + '/profile')
              .putFile(files!);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Collection(
                        username: username.text,
                        loc: latlong,
                      )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please enter all the fields')));
        }
      }
    });
  }
}
