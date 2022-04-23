import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCard extends StatelessWidget {
  final image, title, desc;
  const BookCard({Key? key, this.title, this.image, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
            Image.network(
              this.image,
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.mali(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                desc,
                style:
                    GoogleFonts.rosarivo(color: Color(0xffB1B1B1), fontSize: 9),
              ),
            )
          ],
        ),
      ),
    );
  }
}
