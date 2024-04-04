// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? minWidth;
  const Button({
    super.key,
    required this.text,
    this.onPressed,
    required this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none),
      height: 44,
      minWidth: minWidth,
      color: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).indicatorColor,
        ),
      ),
    );
  }
}
