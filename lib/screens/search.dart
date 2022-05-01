import 'dart:async';

import 'package:calc_lat_long/calc_lat_long.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/book_item_card.dart';
import 'bookitem.dart';

class Search extends StatefulWidget {
  final input_text;
  const Search({Key? key, this.input_text}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var box = BoxDecoration(
      borderRadius: BorderRadius.circular(20), color: Color(0xffFFFDF8));
  var clr = Color(0xffFFFDF8);
  var ma = EdgeInsets.fromLTRB(10, 9, 14, 3);
  TextEditingController search_controller = TextEditingController();
  bool loading = false;
  late StreamSubscription stream;
  List search = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    search_controller.text = widget.input_text;
    stream = FirebaseDatabase.instance.ref().onValue.listen((event) {
      var data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      location_distance(data);
    });
  }

  location_distance(data) async {
    var loc = await Location().getLocation();
    final pref = await SharedPreferences.getInstance();
    print(loc);
    await data['book_database'].forEach((k, v) async {
      if (data['book_database'][k]['name']
              .toLowerCase()
              .contains(search_controller.text.toLowerCase()) &&
          k.split('&')[1] != pref.getString('username')) {
        print(k);
        List latlong = data['book_database'][k]['loc'].split(',');

        String lat = latlong[0];
        String long = latlong[1];
        print(latlong);
        var distance = await CalcDistance.distance(double.parse(lat),
            loc.latitude!, double.parse(long), loc.longitude!, UnitLength.km);
        print(distance);
        data['book_database'][k]['loc'] = distance;
        data['book_database'][k]['isbn_username'] = k;
        search.add(data['book_database'][k]);
        print(data['book_database']);
      }
    });
    print('search list');
    setState(() {
      search.sort((a, b) => a["loc"].compareTo(b["loc"]));
      loading = true;
    });
    print(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff7efe5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Color(0xffC19280),
                  size: 31,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xfffafafa),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                        child: TextField(
                          controller: search_controller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              isDense: true,
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffcacaca))),
                              label: Text(
                                'Search for Books',
                                style: GoogleFonts.rosarivo(
                                    fontSize: 18.0, color: Color(0xffcacaca)),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        search = [];
                        loading = false;
                        FirebaseDatabase.instance.ref().onValue.listen((event) {
                          var data = Map<String, dynamic>.from(
                              event.snapshot.value as dynamic);
                          location_distance(data);
                        });
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.zero),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffC19280),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: const Icon(
                            Icons.search,
                            color: Color(0xffE5E5E5),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: loading == false
                    ? Center(
                        child: Lottie.asset("assets/load.json",
                            width: 200, height: 200),
                      )
                    : search.length == 0
                        ? Center(
                            child: Text(
                              'No books were found',
                              style: GoogleFonts.rosarivo(
                                  color: Color(0xffC19280), fontSize: 14),
                            ),
                          )
                        : (GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: search
                                .length, //Book item list has been imported from models/bookcarddata.dart
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, int index) {
                              return Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => Book(
                                                  data: search[index],
                                                )));
                                  },
                                  child: BookCard(
                                    image: search[index][
                                        'url_image'], //Book item list has been imported from models/bookcarddata.dart
                                    title: search[index]['name'],
                                    desc: search[index]['isbn_username']
                                        .split('&')[1],
                                  ),
                                ),
                                margin: ma,
                              );
                            })),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    stream.cancel();
    super.deactivate();
  }
}
