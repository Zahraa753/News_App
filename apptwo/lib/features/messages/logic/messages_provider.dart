import 'package:appone/core/data/app_data.dart';
import 'package:appone/core/data/models/user_model.dart';
import 'package:appone/features/messages/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesProvider extends ChangeNotifier {
  final messageController = TextEditingController();

  void sendMessage(UserModel receiverUser) async {
    if (messageController.text.isEmpty) return;
    final messageId = DateTime.now().millisecondsSinceEpoch.toString();
    final message = MessageModel(
      id: messageId,
      receiverName: receiverUser.name,
      receiverUid: receiverUser.uid,
      senderName: user!.name,
      senderUid: user!.uid,
      createdAt: DateTime.now().toString(),
      content: messageController.text,
    );
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(messageId)
        .set(message.toMap());

    messageController.clear();
  }

  List<MessageModel> messages = [];
  void getAllMessages(UserModel receiverUser) async {
    FirebaseFirestore.instance
        .collection("messages")
        .where('receiverUid', whereIn: [user!.uid, receiverUser.uid])
        .where('senderUid', whereIn: [user!.uid, receiverUser.uid])
        .snapshots()
        .listen((event) {
          messages.clear();
          final docs = event.docs;
          for (var doc in docs) {
            final message = MessageModel.fromMap(doc.data());
            print(message.senderName);
            messages.add(message);
          }
          notifyListeners();
        });
  }
}
