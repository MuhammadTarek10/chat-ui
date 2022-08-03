import 'package:chatflutterui/constants.dart';
import 'package:chatflutterui/models/chat_message.dart';
import 'package:chatflutterui/views/messages/widgets/chat_input_field.dart';
import 'package:chatflutterui/views/messages/widgets/message.dart';
import 'package:flutter/material.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Message(
                message: demeChatMessages[index],
              ),
            ),
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}
