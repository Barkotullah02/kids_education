import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_education/pages/homepage.dart';
import 'package:kids_education/pages/chat_page.dart';
import 'package:kids_education/constants/app_constants.dart';

void main() {
  runApp(const KidsEducationApp());
}

class KidsEducationApp extends StatelessWidget {
  const KidsEducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Homepage.id,
      routes: {
        Homepage.id: (context) => const Homepage(),
        ChatPage.id: (context) => const ChatPage(),
      },
    );
  }
}

