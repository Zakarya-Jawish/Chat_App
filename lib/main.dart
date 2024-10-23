import 'package:chat_app/views/login_veiw.dart';
import 'package:chat_app/views/register_veiw.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const TalkToMe());
}

class TalkToMe extends StatelessWidget {
  const TalkToMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginVeiw.id: (context) => const LoginVeiw(),
        RegisterVeiw.id: (context) => const RegisterVeiw(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginVeiw.id,
    );
  }
}
/* */