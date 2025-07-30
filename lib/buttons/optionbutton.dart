import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class Optionbutton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  
  const Optionbutton({
    super.key, 
    required this.text, 
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppConstants.buttonWidth,
        decoration: BoxDecoration(
          color: AppConstants.backgroundColor,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Row(
            children: [
              Icon(
                icon,
                size: AppConstants.iconSizeMedium,
                color: AppConstants.primaryColor,
              ),
              const SizedBox(width: AppConstants.spacingSmall),
              Expanded(
                child: Text(
                  text,
                  style: AppConstants.buttonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
