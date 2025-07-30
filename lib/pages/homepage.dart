import 'package:flutter/material.dart';
import 'package:kids_education/buttons/optionbutton.dart';
import 'package:kids_education/pages/chat_page.dart';
import '../constants/app_constants.dart';
import '../widgets/common_widgets.dart';

class Homepage extends StatefulWidget {
  static const String id = "/home";
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _navigateToChat() {
    Navigator.pushNamed(context, ChatPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.customAppBar(
        title: AppConstants.appTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: _navigateToChat,
            tooltip: AppConstants.chatTitle,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToChat,
        tooltip: AppConstants.chatTitle,
        child: const Icon(Icons.record_voice_over),
      ),
      body: SingleChildScrollView(
        child: CommonWidgets.paddedContainer(
          padding: const EdgeInsets.only(left: AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets.pageHeading(
                title: AppConstants.createExamTitle,
                subtitle: AppConstants.customizeTestSubtitle,
              ),
              CommonWidgets.mediumVerticalSpace,
              CommonWidgets.sectionTitle(AppConstants.examFormatTitle),
              CommonWidgets.xLargeVerticalSpace,
              
              // Exam Format Options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Optionbutton(
                    text: "Interactive\nQuiz",
                    icon: Icons.edit_outlined,
                    onTap: () {
                      // TODO: Implement interactive quiz functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Interactive Quiz selected!')),
                      );
                    },
                  ),
                  CommonWidgets.mediumHorizontalSpace,
                  Optionbutton(
                    text: "Download\nPDF",
                    icon: Icons.file_download,
                    onTap: () {
                      // TODO: Implement PDF download functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('PDF Download selected!')),
                      );
                    },
                  ),
                ],
              ),
              CommonWidgets.largeVerticalSpace,
              
              CommonWidgets.sectionTitle(AppConstants.interactionTypeTitle),
              CommonWidgets.largeVerticalSpace,
              
              // Interaction Type Options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Optionbutton(
                    text: "Multiple\nChoice",
                    icon: Icons.newspaper,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Multiple Choice selected!')),
                      );
                    },
                  ),
                  CommonWidgets.mediumHorizontalSpace,
                  Optionbutton(
                    text: "Fill in the\nBlanks",
                    icon: Icons.title,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Fill in the Blanks selected!')),
                      );
                    },
                  ),
                ],
              ),
              CommonWidgets.largeVerticalSpace,
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Optionbutton(
                    text: "True or\nFalse",
                    icon: Icons.check,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('True or False selected!')),
                      );
                    },
                  ),
                  CommonWidgets.mediumHorizontalSpace,
                  Optionbutton(
                    text: "Short\nAnswer",
                    icon: Icons.short_text,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Short Answer selected!')),
                      );
                    },
                  ),
                ],
              ),
              CommonWidgets.largeVerticalSpace,
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Optionbutton(
                    text: "Matching\nPair",
                    icon: Icons.check_box_outline_blank_rounded,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Matching Pair selected!')),
                      );
                    },
                  ),
                  const SizedBox(width: 162),
                ],
              ),
              
              CommonWidgets.largeVerticalSpace,
              
              // Chat Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                margin: const EdgeInsets.only(right: AppConstants.paddingLarge),
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                  border: Border.all(
                    color: AppConstants.primaryColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.record_voice_over,
                      size: AppConstants.iconSizeLarge,
                      color: AppConstants.primaryColor,
                    ),
                    CommonWidgets.smallVerticalSpace,
                    Text(
                      'Need Help?',
                      style: AppConstants.sectionTitleStyle.copyWith(
                        color: AppConstants.primaryColor,
                        fontSize: AppConstants.fontSizeLarge,
                      ),
                    ),
                    CommonWidgets.smallVerticalSpace,
                    Text(
                      'Ask me anything about your studies!',
                      style: AppConstants.subheadingStyle,
                      textAlign: TextAlign.center,
                    ),
                    CommonWidgets.mediumVerticalSpace,
                    ElevatedButton.icon(
                      onPressed: _navigateToChat,
                      icon: const Icon(Icons.chat),
                      label: const Text('Start Chatting'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingLarge,
                          vertical: AppConstants.paddingMedium,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

