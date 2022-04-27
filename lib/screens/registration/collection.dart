import 'dart:convert';
import 'package:allabtbooks/screens/registration/friend_request.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:allabtbooks/models/bookcarddata.dart';

class Collection extends StatefulWidget {
  final username, loc;
  const Collection({Key? key, this.username, this.loc}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  File? files = null;
  TextEditingController isbn = TextEditingController();
  TextEditingController name_of_book = TextEditingController();
  TextEditingController author = TextEditingController();
  String dropdownValue = 'Thriller';
  var add_state = false;
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
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 72, 8, 8),
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
                                          add_state = true;
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
                                      onChanged: textval_changed,
                                      controller: name_of_book,
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
                                      controller: author,
                                      onChanged: textval_changed,
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
                                      controller: isbn,
                                      onChanged: textval_changed,
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 8.0, 8, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: DropdownButton<String>(
                                    isExpanded: true,
                                    dropdownColor:
                                        Colors.black.withOpacity(0.75),
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_downward,
                                        color: Color(0xffFFEDD1)),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 1,
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: genres
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: GoogleFonts.rosarivo(
                                              fontSize: 16,
                                              color: Color(0xffFFEDD1)),
                                        ),
                                      );
                                    }).toList(),
                                  ))
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
                    onPressed: added,
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
                            add_state ? 'ADD' : 'NEXT',
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

  void textval_changed(text) {
    if (text != '') {
      setState(() {
        add_state = true;
      });
    }
  }

  added() async {
    if (add_state == true) {
      if (name_of_book.text != '' &&
          files != null &&
          author.text != '' &&
          isbn.text != '') {
        var stringOfArticles = await http.read(Uri.parse(
            'https://openlibrary.org/api/books?bibkeys=ISBN:' +
                isbn.text +
                '&jscmd=data&format=json'));
        Map mapOfArticles = json.decode(stringOfArticles);
        print(mapOfArticles);

        DatabaseReference ref = await FirebaseDatabase.instance.ref();
        ref
            .child('users/' + widget.username + '/collection/' + isbn.text)
            .update({
          'isbn': isbn.text,
          'name': mapOfArticles['ISBN:' + isbn.text]['title'],
          'author': mapOfArticles['ISBN:' + isbn.text]['authors'][0]['name'],
          'genre': dropdownValue,
          'url_image': mapOfArticles['ISBN:' + isbn.text]['cover']['large']
        });
        ref
            .child('book_database/' + isbn.text + '&' + widget.username + '/')
            .update({
          'loc': widget.loc,
          'name': mapOfArticles['ISBN:' + isbn.text]['title'],
          'author': mapOfArticles['ISBN:' + isbn.text]['authors'][0]['name'],
          'genre': dropdownValue,
          'url_image': mapOfArticles['ISBN:' + isbn.text]['cover']['large']
        });
        FirebaseStorage.instance
            .ref('users/' + widget.username + '/collection/' + isbn.text)
            .putFile(files!);
        setState(() {
          add_state = false;
          files = null;
          name_of_book.clear();
          author.clear();
          isbn.clear();
          dropdownValue = "Thriller";
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please enter all the fields')));
      }
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FriendRequest(
                    username: widget.username,
                  )));
    }
  }
}
