import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create a new exam",
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Customize your test parameters",
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Exam Format",
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
