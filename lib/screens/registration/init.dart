import 'package:allabtbooks/screens/registration/auth.dart';
import 'package:allabtbooks/screens/homep.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitializerWidget extends StatefulWidget {
  final registering;
  const InitializerWidget({Key? key, this.registering}) : super(key: key);

  @override
  State<InitializerWidget> createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth? _auth;
  User? _user;
  bool isLoading = true;
  String username = '';
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth!.currentUser;
    route();
  }

  Future<void> route() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('username') != null) {
      setState(() {
        isLoading = false;
        username = prefs.getString('username')!;
      });
    }

    if (_user == null) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        print("This is running");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Authenticate()));
      });
    }

    print("This is also running");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            appBar: AppBar(
              title: const Text("AllAbtBooks"),
            ),
            body: const Center(child: CircularProgressIndicator()),
          )
        : Home(
            username: username,
          );
  }
}
