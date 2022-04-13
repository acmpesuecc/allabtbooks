import 'package:flutter/material.dart';
import 'package:allabtbooks/screens/homep.dart';
import 'package:allabtbooks/screens/chat/chat.dart';
import 'package:allabtbooks/screens/profile/profile.dart';

void bottom_navigation(int index, BuildContext context) {
  if (index == 0) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  } else if (index == 2) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
  } else if (index == 3) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
  }
}
