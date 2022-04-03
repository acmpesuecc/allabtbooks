import 'package:allabtbooks/chat/dialogue.dart';
import 'package:allabtbooks/chat/final_details.dart';
import 'package:allabtbooks/chat/finalize_details.dart';
import 'package:allabtbooks/search.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';
import 'homep.dart';
import 'chat/books_involved.dart';
import 'chat/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
