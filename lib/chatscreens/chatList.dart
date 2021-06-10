import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_blog/chatscreens/detailChat.dart';
import 'package:firebase_blog/models/user.dart';
import 'package:firebase_blog/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_blog/utils/colors.dart';

class ChatList extends StatefulWidget {
  ChatList({Key key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  TextStyle titletxt = TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 17.0,
      color: Hexcolor(myColors.primary2));
  TextStyle subtxt = TextStyle(
      fontFamily: 'Montserrat', fontSize: 12.0, color: Hexcolor("#8c8382"));
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection("newUsers")
          .orderBy("username")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text("No Chats Yet"),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot thisUser = snapshot.data.documents[index];
              
              User selectedUser = User(
                name: thisUser["username"],
                uid: thisUser["uid"],
                profilePhoto: thisUser["userimage"],
                email:  thisUser["email"],
              );

              return thisUser["uid"] != userid
                  ? Column(
                      children: <Widget>[
                        ListTile(
                          trailing: Text(
                            "22/03/20",
                            style: subtxt,
                          ),
                          leading: CircleAvatar(
                            radius: 24.0,
                            backgroundImage:
                                NetworkImage('${thisUser['userimage']}'),
                          ),
                          title: Text(
                            '${thisUser['username']}',
                            style: titletxt,
                          ),
                          subtitle: Text(
                            "Lorem ipsum doler ismet",
                            style: subtxt,
                          ),
                          onTap: () {
                            String uname = thisUser["username"];
                            print(uname);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => detailChat(
                                      receiver :selectedUser,
                                    )));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 65.0,
                          ),
                          child: Divider(
                            height: 3.0,
                            thickness: 0.8,
                          ),
                        ),
                      ],
                    )
                  : Container();
            },
          );
        }
      },
    );
  }
}
