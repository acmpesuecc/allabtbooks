import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  File? files = null;
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
                    onPressed: () {},
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
}
