import 'package:chatflutterui/constants.dart';
import 'package:chatflutterui/models/chat_message.dart';
import 'package:chatflutterui/views/messages/widgets/audio_message.dart';
import 'package:chatflutterui/views/messages/widgets/text_message.dart';
import 'package:chatflutterui/views/messages/widgets/video_message.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            const SizedBox(width: kDefaultPadding / 2)
          ],
          messageContaint(message),
          if (message.isSender)
            MessageStatusDot(
              status: message.messageStatus,
            ),
        ],
      ),
    );
  }

  Widget messageContaint(ChatMessage message) {
    switch (message.messageType) {
      case ChatMessageType.text:
        return TextMessage(message: message);
      case ChatMessageType.audio:
        return AudioMessage(message: message);
      case ChatMessageType.image:
        return const SizedBox();
      case ChatMessageType.video:
        return VideoMessage(message: message);
      default:
        return const SizedBox();
    }
  }
}

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({Key? key, required this.status}) : super(key: key);

  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(context, status),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.viewed ? Icons.done : Icons.close,
        size: 8,
        color: Colors.white,
      ),
    );
  }

  Color dotColor(BuildContext context, MessageStatus status) {
    switch (status) {
      case MessageStatus.notSent:
        return kErrorColor;
      case MessageStatus.notView:
        return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
      case MessageStatus.viewed:
        return kPrimaryColor;
      default:
        return Colors.transparent;
    }
  }
}
