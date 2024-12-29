import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/show_snack_bar.dart';
import 'register_veiw.dart';

class LoginVeiw extends StatefulWidget {
  const LoginVeiw({super.key});
  static String id = 'Login';

  @override
  State<LoginVeiw> createState() => _LoginVeiwState();
}

class _LoginVeiwState extends State<LoginVeiw> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  String email = "", password = "";
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.amber,
      ),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 130,
                  ),
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
                  const Row(
                    children: [
                      Text('Login',
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
                    text: 'Login',
                    function: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          setState(() {
                            isLoading = true;
                          });
                          await loginUser();
                          if (!context.mounted) return;
                          Navigator.pushNamed(context, ChatView.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          String message = e.toString();
                          if (e.code == 'user-not-found') {
                            message = ('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            message =
                                ('Wrong password provided for that user.');
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterVeiw.id);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.amber),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
