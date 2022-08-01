import 'package:chatflutterui/constants.dart';
import 'package:chatflutterui/views/chat/chat_view.dart';
import 'package:chatflutterui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SigninOrSignUpView extends StatelessWidget {
  const SigninOrSignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/Logo_light.png"
                    : "assets/images/Logo_dark.png",
                height: 200,
              ),
              const Spacer(),
              PrimaryButton(
                text: "Sign in",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatView()),
                ),
              ),
              const SizedBox(
                height: kDefaultPadding * 1.5,
              ),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Sign up",
                press: () {},
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
