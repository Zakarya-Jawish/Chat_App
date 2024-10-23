import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterVeiw extends StatelessWidget {
  const RegisterVeiw({super.key});
  static String id = 'Register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/scholar.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Text('Talk To Me',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.amber,
                      fontFamily: 'Pacifico',
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text('Enter your information please:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextField(
                  hintText: 'Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextField(
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextField(
                  hintText: 'Password',
                ),
                const SizedBox(height: 10),
                const CustomTextField(
                  hintText: 'Phone',
                ),
                const SizedBox(height: 20),
                CustomButton(function: () {}, text: 'Register'),
              ],
            ),
          ),
        ));
  }
}
