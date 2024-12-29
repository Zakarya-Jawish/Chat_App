import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_veiw.dart';
import 'package:chat_app/views/register_veiw.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChatView.id: (context) => ChatView(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginVeiw.id,
      // home: ChatView(),
    );
  }
}
