import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/book_item_card.dart';
import 'package:allabtbooks/models/bookcarddata.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    search_controller.text = widget.input_text;
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
                onPressed: () {},
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
                      onPressed: () {},
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
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: bookitem
                        .length, //Book item list has been imported from models/bookcarddata.dart
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, int index) {
                      return Container(
                        child: BookCard(
                          image: bookitem[index][
                              0], //Book item list has been imported from models/bookcarddata.dart
                          title: bookitem[index][1],
                          desc: bookitem[index][2],
                        ),
                        margin: ma,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
