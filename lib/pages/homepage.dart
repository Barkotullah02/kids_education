import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {

  static const String id = "/home";
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kids Education",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Create a new exam",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
