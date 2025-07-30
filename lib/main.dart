import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_education/pages/homepage.dart';

void main() {
  runApp(const KidsEducationApp());
}

class KidsEducationApp extends StatelessWidget {
  const KidsEducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Education',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Comic Sans MS',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          brightness: Brightness.light,
        ),
      ),
      initialRoute: Homepage.id,
      routes: {
        Homepage.id : (context) => const Homepage(),
      },
    );
  }
}

