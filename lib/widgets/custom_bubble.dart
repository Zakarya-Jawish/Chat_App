import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomBubble extends StatelessWidget {
  const CustomBubble({
    super.key,
    required this.daercation,
    required this.message,
  });
  final bool daercation;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: daercation ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.8),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: !daercation ? kPrimaryColor : Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(30),
            bottomRight: daercation
                ? const Radius.circular(30)
                : const Radius.circular(0),
            bottomLeft: daercation
                ? const Radius.circular(0)
                : const Radius.circular(30),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
