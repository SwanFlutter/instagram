// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CastomTextField extends StatelessWidget {
  double size;
  TextEditingController? controller;
  String text;
  IconData icon;
  Widget iconPassword;
  String? Function(String?)? validator;
  bool obscureText;
  bool enabled;
  CastomTextField({
    super.key,
    required this.size,
    this.controller,
    required this.text,
    required this.icon,
    this.iconPassword = const SizedBox(),
    this.validator,
    this.obscureText = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: 55,
      child: TextFormField(
        obscureText: obscureText,
        enabled: enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                const BorderSide(color: Color.fromRGBO(250, 250, 250, 1)),
          ),
          label: Text(text),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          suffixIcon: iconPassword,
          fillColor: const Color.fromRGBO(250, 250, 250, 1),
          filled: true,
        ),
      ),
    );
  }
}
