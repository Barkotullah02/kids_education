import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  
  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: AppConstants.paddingLarge,
        ),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: message.isUser 
              ? AppConstants.chatBubbleUserColor 
              : AppConstants.chatBubbleBotColor,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.message,
              style: AppConstants.chatMessageStyle.copyWith(
                color: message.isUser ? Colors.white : AppConstants.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.formattedTime,
              style: AppConstants.chatTimeStyle.copyWith(
                color: message.isUser 
                    ? Colors.white.withOpacity(0.8) 
                    : AppConstants.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}