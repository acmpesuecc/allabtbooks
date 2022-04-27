import 'package:allabtbooks/screens/chat/finalize_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Books_involved extends StatefulWidget {
  final second_user;
  const Books_involved({Key? key, this.second_user}) : super(key: key);
  @override
  _Books_involvedState createState() => _Books_involvedState();
}

class _Books_involvedState extends State<Books_involved> {
  List books1 = [];
  List books2 = [];
  List selected = [];
  var loading = true;
  var book = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial_display();
  }

  initial_display() async {
    final pref = await SharedPreferences.getInstance();
    FirebaseDatabase.instance
        .ref('users/' + pref.getString('username')! + '/collection')
        .get()
        .then((event) {
      var data = Map<String, dynamic>.from(event.value as dynamic);
      setState(() {
        data.forEach((key, value) {
          books1.add([data[key]['name'], data[key]['url_image']]);
          loading = false;
        });
      });
    });
    FirebaseDatabase.instance
        .ref('users/' + widget.second_user + '/collection')
        .get()
        .then((event) {
      var data = Map<String, dynamic>.from(event.value as dynamic);
      setState(() {
        data.forEach((key, value) {
          books2.add([data[key]['name'], data[key]['url_image']]);
          loading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7EFE5),
        body: loading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.transparent),
                              ),
                              child: Text(
                                'BACK',
                                style: GoogleFonts.rosarivo(
                                    fontSize: 14,
                                    color: const Color(0xff545454)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Books involved:',
                                style: GoogleFonts.mali(
                                    fontSize: 24,
                                    color: const Color(0xff30011E)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: selected.length > 0
                                    ? BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(selected[0][1]),
                                            fit: BoxFit.cover))
                                    : BoxDecoration(
                                        color: const Color(0xffC4C4C4),
                                      ),
                                height: 200,
                                width:
                                    MediaQuery.of(context).size.width * 2 / 5,
                              ),
                              Container(
                                decoration: selected.length > 1
                                    ? BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(selected[1][1]),
                                            fit: BoxFit.cover))
                                    : BoxDecoration(
                                        color: const Color(0xffC4C4C4),
                                      ),
                                height: 200,
                                width:
                                    MediaQuery.of(context).size.width * 2 / 5,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 490,
                            child: book == 1
                                ? ListView.builder(
                                    itemCount: books1.length,
                                    itemBuilder: (BuildContext ctx, int i) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            selected.add(books1[i]);
                                            book = book + 1;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 1,
                                              color: const Color(0xffA4A4A4),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Text(
                                                books1[i][0],
                                                style: GoogleFonts.rosarivo(
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 1,
                                              color: const Color(0xffA4A4A4),
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                : ListView.builder(
                                    itemCount: books2.length,
                                    itemBuilder: (BuildContext ctx, int i) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            selected.add(books2[i]);
                                            book = book + 1;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 1,
                                              color: const Color(0xffA4A4A4),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Text(
                                                books2[i][0],
                                                style: GoogleFonts.rosarivo(
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 1,
                                              color: const Color(0xffA4A4A4),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => Meet_Details(
                                      selected_books: selected,
                                      second_user: widget.second_user,
                                    )));
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.55),
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
                              'SET MEETING POINT',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rosarivo(
                                  fontSize: 18, color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
