import 'package:chatflutterui/constants.dart';
import 'package:chatflutterui/models/chat.dart';
import 'package:chatflutterui/views/chat/widgets/chat_card.dart';
import 'package:chatflutterui/views/messages/message_view.dart';
import 'package:chatflutterui/widgets/filled_outline_button.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
            kDefaultPadding,
            0,
            kDefaultPadding,
            kDefaultPadding,
          ),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent"),
              const SizedBox(width: kDefaultPadding),
              FillOutlineButton(press: () {}, text: "Active", isFilled: false),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MessageView())),
            ),
          ),
        ),
      ],
    );
  }
}
