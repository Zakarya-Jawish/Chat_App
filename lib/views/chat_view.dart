// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bubble.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'ChatView';
  CollectionReference messagesColection =
      FirebaseFirestore.instance.collection(kMessageCollection);
  TextEditingController controller = TextEditingController();
  final ScrollController controllerList = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.settingsOf(context)!.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messagesColection.orderBy(kCreatedAt).snapshots(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<MessageModel> messages = [];
            for (int i = 0; i < snapShot.data!.docs.length; i++) {
              messages.add(MessageModel.fromJson(snapShot.data!.docs[i]));
            }
            return Scaffold(
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {},
              //   shape: ,
              // ),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Talk To Me',
                      style: TextStyle(color: Colors.white),
                    ),
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: controllerList,
                      itemBuilder: (context, index) => CustomBubble(
                        daercation: messages[index].id == email,
                        message: messages[index].message,
                      ),
                      itemCount: messages.length,
                    ),
                  ),
                  CustomTextField(
                    controller: controller,
                    onSubmitted: (data) {
                      if (data!.isNotEmpty) {
                        messagesColection.add({
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': email,
                        }).then((value) {
                          log('message sended');
                          controller.clear();
                          controllerList.animateTo(
                            controllerList.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }).catchError((error) {
                          debugPrint('error on send: $error');
                        });
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
