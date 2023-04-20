import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/chat_user.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
      // elevation: .5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(CupertinoIcons.person_alt),
          ),

          // showing user information on card
          title: Text(widget.user.name),
          subtitle: Text(
            widget.user.about,
            maxLines: 1,
          ),
          trailing: Text(
            '12:00 PM',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
