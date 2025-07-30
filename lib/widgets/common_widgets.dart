import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CommonWidgets {
  // Reusable spacing widgets
  static Widget get smallVerticalSpace => const SizedBox(height: AppConstants.spacingSmall);
  static Widget get mediumVerticalSpace => const SizedBox(height: AppConstants.spacingMedium);
  static Widget get largeVerticalSpace => const SizedBox(height: AppConstants.spacingLarge);
  static Widget get xLargeVerticalSpace => const SizedBox(height: AppConstants.spacingXLarge);
  
  static Widget get smallHorizontalSpace => const SizedBox(width: AppConstants.spacingSmall);
  static Widget get mediumHorizontalSpace => const SizedBox(width: AppConstants.spacingLarge);
  static Widget get largeHorizontalSpace => const SizedBox(width: AppConstants.spacingXLarge);
  
  // Reusable padding widget
  static Widget paddedContainer({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(AppConstants.paddingLarge),
      child: child,
    );
  }
  
  // Section title widget
  static Widget sectionTitle(String title) {
    return Text(
      title,
      style: AppConstants.sectionTitleStyle,
    );
  }
  
  // Page heading widget
  static Widget pageHeading({
    required String title,
    String? subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppConstants.headingStyle),
        if (subtitle != null) ...[
          const SizedBox(height: 1),
          Text(subtitle, style: AppConstants.subheadingStyle),
        ],
      ],
    );
  }
  
  // Custom app bar
  static PreferredSizeWidget customAppBar({
    required String title,
    List<Widget>? actions,
    Widget? leading,
  }) {
    return AppBar(
      title: Text(title),
      actions: actions,
      leading: leading,
    );
  }
  
  // Loading indicator
  static Widget loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppConstants.primaryColor),
      ),
    );
  }
  
  // Empty state widget
  static Widget emptyState({
    required String message,
    IconData? icon,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 64,
              color: AppConstants.textSecondaryColor,
            ),
            const SizedBox(height: 16),
          ],
          Text(
            message,
            style: AppConstants.subheadingStyle.copyWith(
              color: AppConstants.textSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}