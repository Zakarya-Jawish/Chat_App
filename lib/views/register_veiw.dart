// ignore_for_file: must_be_immutable

import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterVeiw extends StatefulWidget {
  const RegisterVeiw({super.key});
  static String id = 'Register';

  @override
  State<RegisterVeiw> createState() => _RegisterVeiwState();
}

class _RegisterVeiwState extends State<RegisterVeiw> {
  String? email;

  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.amber,
      ),
      child: Scaffold(
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
              child: Form(
                key: formKey,
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
                    CustomTextFormField(
                      hintText: 'Email',
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: 'Password',
                      onChanged: (pass) {
                        password = pass;
                      },
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Register',
                      function: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            await registerUser();
                            if (!context.mounted) return;
                            Navigator.pushNamed(context, ChatView.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            String message = e.toString();
                            if (e.code == 'weak-password') {
                              message = 'The password provided is too weak.';
                            } else if (e.code == 'email-already-in-use') {
                              message =
                                  'The account already exists for that email.';
                            }
                            showSnak(context, message, Colors.amber);
                          } catch (e) {
                            debugPrint(e.toString());
                            showSnak(context, e.toString(), Colors.amber);
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
