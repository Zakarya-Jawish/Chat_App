import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.onSubmitted, this.controller});
  final void Function(String?) onSubmitted;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: 'Type your message here...',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    )),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                // enabledBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(20),
                //   ),
                // ),
                // focusedBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(20),
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
