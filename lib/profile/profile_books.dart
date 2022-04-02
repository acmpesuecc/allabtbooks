import 'package:flutter/material.dart';
import 'package:allabtbooks/widget/book_item_card.dart';

class ProfileBooks extends StatefulWidget {
  @override
  _ProfileBooksState createState() => _ProfileBooksState();
}

class _ProfileBooksState extends State<ProfileBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EFE5),
      body: SafeArea(
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 10,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Color(0xffFFFDF8),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                offset: Offset(0, 4),
                                color: Colors.black.withOpacity(0.25))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 65,
                            color: Color(0xffD1D1D1),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const BookCard(
                  image: 'assets/images/image.jpg',
                  title: 'Harry Potter and the Philospher Stone',
                  desc: 'nigeldias27',
                );
              }
            }),
      ),
    );
  }
}
