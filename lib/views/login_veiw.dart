import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'register_veiw.dart';

class LoginVeiw extends StatelessWidget {
  const LoginVeiw({super.key});
  static String id = 'Login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
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
              const CustomTextField(
                hintText: 'Email',
              ),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: 'Password',
              ),
              const SizedBox(height: 20),
              CustomButton(function: () {}, text: 'Login'),
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
    );
  }
}
