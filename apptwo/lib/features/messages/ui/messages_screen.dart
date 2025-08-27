import 'package:appone/core/data/models/user_model.dart';
import 'package:appone/core/widgets/custom_text_field.dart';
import 'package:appone/features/messages/logic/messages_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatelessWidget {
  final UserModel user;
  const MessagesScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessagesProvider()..getAllMessages(user),
      builder: (context, child) => Scaffold(
        appBar: AppBar(title: Text(user.name)),
        body: Consumer<MessagesProvider>(
          builder: (context, provider, _) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final dateTime = DateTime.parse(
                            provider.messages[index].createdAt,
                          );
                          final dateFormatted =
                              '${DateFormat.yMMMd().format(dateTime)}, ${DateFormat.Hms().format(dateTime)}';

                          bool isSender =
                              provider.messages[index].senderUid ==
                              FirebaseAuth.instance.currentUser!.uid;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: isSender
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            spacing: 10,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isSender
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey[100],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(
                                      isSender ? 12 : 0,
                                    ),
                                    bottomRight: Radius.circular(
                                      isSender ? 0 : 12,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  provider.messages[index].content,
                                  style: TextStyle(
                                    color: isSender
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 5),
                        itemCount: provider.messages.length,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: provider.messageController,
                            hintText: 'Enter Message here',
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.sendMessage(user);
                          },
                          icon: Icon(
                            Icons.send,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
