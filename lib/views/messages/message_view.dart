import 'package:chatflutterui/constants.dart';
import 'package:chatflutterui/views/messages/widgets/messege_body.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const MessageBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Kristen Watson",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3 min ago",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.videocam),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.local_phone),
        ),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
