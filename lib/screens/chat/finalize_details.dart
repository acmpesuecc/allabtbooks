import 'package:allabtbooks/screens/chat/dialogue.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Meet_Details extends StatefulWidget {
  final selected_books, second_user;
  const Meet_Details({Key? key, this.selected_books, this.second_user})
      : super(key: key);

  @override
  _Meet_DetailsState createState() => _Meet_DetailsState();
}

class _Meet_DetailsState extends State<Meet_Details> {
  String date_time = 'Set a date and time';
  Marker loc = const Marker(markerId: MarkerId('marker'));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7EFE5),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontSize: 14, color: const Color(0xff545454)),
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
                          'Set Meeting Details:',
                          style: GoogleFonts.mali(
                              fontSize: 24, color: const Color(0xff30011E)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 48, 8, 8),
                    child: Row(
                      children: [
                        Text(
                          'Time:',
                          style: GoogleFonts.rosarivo(
                              fontSize: 24, color: const Color(0xff30011E)),
                        ),
                        TextButton(
                          onPressed: () async {
                            final todayDate = DateTime.now();
                            final pickDate = await showDatePicker(
                                context: context,
                                initialDate: todayDate,
                                firstDate: todayDate,
                                lastDate: DateTime(todayDate.year + 1));
                            if (pickDate != null) {
                              final pickTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      const TimeOfDay(hour: 9, minute: 0));
                              if (pickTime != null) {
                                setState(() {
                                  date_time = pickDate.day.toString() +
                                      '/' +
                                      pickDate.month.toString() +
                                      '/' +
                                      pickDate.year.toString() +
                                      ' ' +
                                      pickTime.hour.toString() +
                                      ':' +
                                      pickTime.minute.toString();
                                });
                              }
                            }
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.transparent),
                          ),
                          child: Row(
                            children: [
                              Text(
                                date_time,
                                style: GoogleFonts.rosarivo(
                                    fontSize: 14,
                                    color: const Color(0xff545454)),
                              ),
                              const Icon(Icons.arrow_drop_down,
                                  color: Color(0xff545454)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Location:',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.rosarivo(
                          fontSize: 24, color: const Color(0xff30011E)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 400,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(12.934695, 77.601991),
                          zoom: 11.5,
                        ),
                        markers: {loc},
                        onLongPress: addMarker,
                      ),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  var push = FirebaseDatabase.instance
                      .ref('users/' +
                          pref.getString('username')! +
                          '/chat/' +
                          widget.second_user +
                          '/')
                      .push();

                  await push.set({
                    'timestamp': DateTime.now().toString(),
                    'issue': pref.getString('username'),
                    'loc': loc.position.latitude.toString() +
                        ',' +
                        loc.position.longitude.toString(),
                    'datetime': date_time,
                    'books': widget.selected_books[0][0] +
                        '|' +
                        widget.selected_books[1][0]
                  });
                  await FirebaseDatabase.instance
                      .ref('users/' +
                          widget.second_user +
                          '/chat/' +
                          pref.getString('username')! +
                          '/' +
                          push.key!)
                      .set({
                    'timestamp': DateTime.now().toString(),
                    'issue': pref.getString('username'),
                    'loc': loc.position.latitude.toString() +
                        ',' +
                        loc.position.longitude.toString(),
                    'datetime': date_time,
                    'books': widget.selected_books[0][0] +
                        '|' +
                        widget.selected_books[1][0]
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => Dialogue(
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
                        'ADD',
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

  void addMarker(LatLng argument) {
    setState(() {
      loc = Marker(markerId: MarkerId('marker'), position: argument);
    });
  }
}
