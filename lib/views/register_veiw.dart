// ignore_for_file: must_be_immutable

import 'package:chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterVeiw extends StatelessWidget {
  RegisterVeiw({super.key});
  static String id = 'Register';
  String? email;
  String? password;
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
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Password',
                  onChanged: (pass) {
                    password = pass;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Register',
                  function: () async {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email!, password: password!);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'Success!',
                            style: TextStyle(color: kPrimaryColor),
                          )));
                    } on FirebaseAuthException catch (e) {
                      //print(e.toString());
                      String message = e.toString();
                      if (e.code == 'weak-password') {
                        message = 'The password provided is too weak.';
                      } else if (e.code == 'email-already-in-use') {
                        message = 'The account already exists for that email.';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.amber,
                          content: Text(
                            message,
                            style: const TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      );
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
