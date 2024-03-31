import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.send,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Send a message',
          ),
        ),
      ),
    );
  }
}
