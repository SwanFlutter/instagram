// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constant.dart';

// ignore: must_be_immutable
class CreateAccount extends StatelessWidget {
  final String textQuestion;
  final String text;
  final void Function()? onPressed;
  final TextStyle? style;
  const CreateAccount({
    super.key,
    required this.text,
    this.onPressed,
    required this.style,
    this.textQuestion = "Already have an account?",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textQuestion, style: ConstantAuthen.textStylebottom),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: style,
          ),
        ),
      ],
    );
  }
}
