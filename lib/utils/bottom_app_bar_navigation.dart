import 'package:flutter/material.dart';
import 'package:allabtbooks/screens/homep.dart';
import 'package:allabtbooks/screens/chat/chat.dart';
import 'package:allabtbooks/screens/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> bottom_navigation(int index, BuildContext context) async {
  if (index == 0) {
    final pref = await SharedPreferences.getInstance();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home(
                  username: pref.getString('username'),
                )));
  } else if (index == 2) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
  } else if (index == 3) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
  }
}
