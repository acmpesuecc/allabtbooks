import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Meet_Details extends StatefulWidget {
  @override
  _Meet_DetailsState createState() => _Meet_DetailsState();
}

class _Meet_DetailsState extends State<Meet_Details> {
  String date_time = 'Set a date and time';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF7EFE5),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'BACK',
                        style: GoogleFonts.rosarivo(
                            fontSize: 14, color: Color(0xff545454)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
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
                            final today_date = DateTime.now();
                            final pick_date = await showDatePicker(
                                context: context,
                                initialDate: today_date,
                                firstDate: today_date,
                                lastDate: DateTime(today_date.year + 1));
                            if (pick_date != null) {
                              final pick_time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 9, minute: 0));
                              if (pick_time != null) {
                                setState(() {
                                  date_time = pick_date.day.toString() +
                                      '/' +
                                      pick_date.month.toString() +
                                      '/' +
                                      pick_date.year.toString() +
                                      ' ' +
                                      pick_time.hour.toString() +
                                      ':' +
                                      pick_time.minute.toString();
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
                    child: Row(
                      children: [
                        Text(
                          'Location:',
                          style: GoogleFonts.rosarivo(
                              fontSize: 24, color: Color(0xff30011E)),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.transparent),
                          ),
                          child: Text(
                            'See on google maps',
                            style: GoogleFonts.rosarivo(
                                fontSize: 14, color: Color(0xff545454)),
                          ),
                        )
                      ],
                    ),
                  ),
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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
