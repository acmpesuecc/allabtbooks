import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  File? files = null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/collection.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0, 16, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 130,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 135,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                              (states) => EdgeInsets.zero),
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.transparent),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Skip',
                                          style: GoogleFonts.rosarivo(
                                              fontSize: 14,
                                              color: Color(0xffFFEDD1)),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xffFFeDD1),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 0, 8, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Collection',
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
                                      'Add books that you would like to exchange',
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
                                                Icons.add,
                                                color: Colors.black,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    9,
                                              ),
                                            )
                                          : Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(files!),
                                                      fit: BoxFit.cover)),
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
                                          labelText: "Name of the book",
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
                                          labelText: "Author",
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
                                          labelText: "ISBN Code",
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
                      )
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
