import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Meet_Details extends StatefulWidget {
  const Meet_Details({Key? key}) : super(key: key);

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
                        onPressed: () {},
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
                onPressed: () {},
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
