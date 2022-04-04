import 'package:allabtbooks/init.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AllAbtBooks"),
        actions: [
          TextButton(
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const InitializerWidget()));
            },
          )
        ],
      ),
      body: const Center(child: const Text("This is the HomePage")),
    );
  }
}
