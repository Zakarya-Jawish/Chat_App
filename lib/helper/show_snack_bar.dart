import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

void showSnak(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: const TextStyle(color: kPrimaryColor),
      ),
    ),
  );
}
