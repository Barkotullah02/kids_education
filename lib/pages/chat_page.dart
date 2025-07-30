import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/chat_message.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/common_widgets.dart';

class ChatPage extends StatefulWidget {
  static const String id = "/chat";
  
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    // Add welcome message
    _messages.add(ChatMessage.bot(AppConstants.chatHintMessage));
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage.user(text));
      _isTyping = true;
    });

    _messageController.clear();
    _scrollToBottom();

    // Simulate bot response
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add(ChatMessage.bot(_generateBotResponse(text)));
        _isTyping = false;
      });
      _scrollToBottom();
    });
  }

  String _generateBotResponse(String userMessage) {
    final message = userMessage.toLowerCase();
    
    if (message.contains('math') || message.contains('mathematics')) {
      return "Great! I can help you with math problems. What specific topic would you like to practice? Addition, subtraction, multiplication, or division?";
    } else if (message.contains('science')) {
      return "Science is fascinating! Are you interested in biology, chemistry, physics, or earth science? I can create questions for any of these topics.";
    } else if (message.contains('english') || message.contains('language')) {
      return "English is important for communication! Would you like to practice grammar, vocabulary, reading comprehension, or creative writing?";
    } else if (message.contains('history')) {
      return "History helps us understand the world! Which period or topic interests you? Ancient civilizations, world wars, or maybe local history?";
    } else if (message.contains('question') || message.contains('quiz')) {
      return "I'd be happy to generate questions for you! What subject would you like me to create questions about? Just let me know the topic and difficulty level.";
    } else {
      return "That's an interesting question! I'm here to help you learn. You can ask me about any school subject like math, science, English, or history. What would you like to explore today?";
    }
  }

  void _generateQuestion() {
    final questions = [
      "What is 15 + 27?",
      "Name three planets in our solar system.",
      "What is the capital of France?",
      "How do plants make their food?",
      "What is the past tense of 'run'?",
      "What is 8 × 7?",
      "Name two types of renewable energy.",
      "What is the largest ocean on Earth?",
    ];
    
    final randomQuestion = questions[DateTime.now().millisecond % questions.length];
    
    setState(() {
      _messages.add(ChatMessage.bot("Here's a question for you: $randomQuestion"));
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.customAppBar(
        title: AppConstants.chatTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline),
            onPressed: _generateQuestion,
            tooltip: AppConstants.generateQuestionButton,
          ),
        ],
      ),
      body: Column(
        children: [
          // Generate Question Button at the top
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            child: ElevatedButton.icon(
              onPressed: _generateQuestion,
              icon: const Icon(Icons.auto_awesome),
              label: Text(AppConstants.generateQuestionButton),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.paddingMedium,
                  horizontal: AppConstants.paddingLarge,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                ),
              ),
            ),
          ),
          
          // Chat messages
          Expanded(
            child: _messages.isEmpty
                ? CommonWidgets.emptyState(
                    message: "Start a conversation!",
                    icon: Icons.chat_bubble_outline,
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: _messages.length + (_isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _messages.length && _isTyping) {
                        return const Padding(
                          padding: EdgeInsets.all(AppConstants.paddingLarge),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppConstants.primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text("Thinking..."),
                            ],
                          ),
                        );
                      }
                      return ChatBubble(message: _messages[index]);
                    },
                  ),
          ),
          
          // Message input
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                // Speaker icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppConstants.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
                  ),
                  child: const Icon(
                    Icons.record_voice_over,
                    color: AppConstants.primaryColor,
                    size: AppConstants.iconSizeMedium,
                  ),
                ),
                const SizedBox(width: AppConstants.paddingMedium),
                
                // Text field
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: AppConstants.chatHintText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppConstants.backgroundColor,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingLarge,
                        vertical: AppConstants.paddingMedium,
                      ),
                    ),
                    onSubmitted: _sendMessage,
                    textInputAction: TextInputAction.send,
                  ),
                ),
                
                const SizedBox(width: AppConstants.paddingMedium),
                
                // Send button
                Container(
                  decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
                  ),
                  child: IconButton(
                    onPressed: () => _sendMessage(_messageController.text),
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}