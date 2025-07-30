import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  // Colors
  static const Color primaryColor = Color(0xFF160132);
  static const Color backgroundColor = Color(0xFFEBE9E9);
  static const Color textPrimaryColor = Colors.black;
  static const Color textSecondaryColor = Colors.grey;
  static const Color chatBubbleUserColor = Color(0x95190136);
  static const Color chatBubbleBotColor = Color(0xFFE8F5E8);
  
  // Sizes
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double paddingLarge = 16.0;
  static const double paddingXLarge = 18.0;
  
  static const double borderRadiusSmall = 7.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 20.0;
  
  static const double fontSizeSmall = 13.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 20.0;
  static const double fontSizeXLarge = 22.0;
  
  static const double iconSizeSmall = 20.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  
  static const double buttonWidth = 150.0;
  static const double spacingSmall = 3.0;
  static const double spacingMedium = 7.0;
  static const double spacingLarge = 12.0;
  static const double spacingXLarge = 18.0;
  
  // Strings
  static const String appTitle = 'Kids Education';
  static const String createExamTitle = 'Create a new exam';
  static const String customizeTestSubtitle = 'Customize your test parameters';
  static const String examFormatTitle = 'Exam Format';
  static const String interactionTypeTitle = 'Interaction Type';
  static const String chatTitle = 'Ask Questions';
  static const String generateQuestionButton = 'Generate Question';
  static const String chatHintText = 'Ask me anything...';
  static const String chatHintMessage = 'Hi! I\'m here to help you with your studies. Ask me anything!';
  
  // Text Styles
  static TextStyle get headingStyle => GoogleFonts.inter(
    fontSize: fontSizeXLarge,
    color: textPrimaryColor,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle get subheadingStyle => GoogleFonts.inter(
    fontSize: fontSizeSmall,
    color: textPrimaryColor,
  );
  
  static TextStyle get sectionTitleStyle => GoogleFonts.inter(
    fontSize: fontSizeSmall,
    color: textPrimaryColor,
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle get buttonTextStyle => GoogleFonts.poppins(
    fontSize: fontSizeMedium,
  );
  
  static TextStyle get appBarTitleStyle => const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: fontSizeLarge,
  );
  
  static TextStyle get chatMessageStyle => GoogleFonts.inter(
    fontSize: fontSizeMedium,
    color: textPrimaryColor,
  );
  
  static TextStyle get chatTimeStyle => GoogleFonts.inter(
    fontSize: 12.0,
    color: textSecondaryColor,
  );
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Comic Sans MS',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppConstants.primaryColor,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppConstants.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: AppConstants.appBarTitleStyle.copyWith(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppConstants.primaryColor,
      foregroundColor: Colors.white,
    ),
  );
}