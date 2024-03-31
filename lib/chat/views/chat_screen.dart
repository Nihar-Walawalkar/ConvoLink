import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/chat/views/video_call_screen.dart';
import 'package:untitled/chat/widgets/message_bubble.dart';
import 'package:untitled/chat/widgets/message_text_field.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'CHAT',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => VideoCallScreen(),
                  transition: Transition.zoom,
              );
            },
            icon: const Icon(Icons.video_camera_front),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 16),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, index) => _messages[index],
              separatorBuilder: (_, __) => const SizedBox(
                height: 16,
              ),
            ),
          ),
          const MessageTextField(),
        ],
      ),
    );
  }
}

const _messages = <MessageBubble>[
  MessageBubble(
    profileImageUrl:
        'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png',
    message: 'Hey there! I am using Flutter.',
    date: 'Feb 14, 6:00 PM',
  ),
];
