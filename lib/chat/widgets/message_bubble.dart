import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    this.profileImageUrl,
    required this.message,
    required this.date,
  }) : super(key: key);

  final String? profileImageUrl;
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    final isReceiver = profileImageUrl != null;
    return Row(
      mainAxisAlignment:
          isReceiver ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isReceiver)
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              foregroundImage: NetworkImage(profileImageUrl!),
            ),
          ),
        Flexible(
          child: Column(
            crossAxisAlignment:
                isReceiver ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(maxWidth: 275),
                decoration: BoxDecoration(
                  color: isReceiver ? Colors.green : Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  message,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                date,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        if (!isReceiver)
          const SizedBox(
            width: 12,
          ),
      ],
    );
  }
}
