import 'package:allabtbooks/auth.dart';
import 'package:allabtbooks/homepage.dart';
import 'package:allabtbooks/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  State<InitializerWidget> createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth? _auth;
  User? _user;
  bool isLoading = true;

  @override
  void initState() {
    print("Innitted");
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth!.currentUser;
    route();
  }

  void route() {
    if (_user == null) {
      print("Here");
      SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Authenticate()));
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Built");
    return isLoading
        ? Scaffold(
            appBar: AppBar(
              title: const Text("AllAbtBooks"),
            ),
            body: const Center(child: CircularProgressIndicator()),
          )
        : HomePage();
  }
}
