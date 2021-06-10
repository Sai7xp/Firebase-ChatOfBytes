import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_blog/pages/homescreen.dart';
import 'package:firebase_blog/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icons.dart';

class GetPosts extends StatefulWidget {
  GetPosts({Key key}) : super(key: key);

  @override
  _GetPostsState createState() => _GetPostsState();
}

class _GetPostsState extends State<GetPosts> {
  Future altmethodnotused() async {
    QuerySnapshot qn = await Firestore.instance
        .collection("posts")
        .orderBy("postimage", descending: true)
        .getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection("newPosts")
          .orderBy("timestamp", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text(
              "Wait " + username + " Posts are loading",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Hexcolor(myColors.primary2),
                  fontFamily: "Quicksand"),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot thispost = snapshot.data.documents[index];
              return Container(
                color: Hexcolor("#ffffff"),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 00.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 5.0),
                                    Container(
                                      height: 32.0,
                                      width: 32.0,
                                      // color: Colors.grey,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '${thispost['userimage']}'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 12.0),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${thispost['username']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0,
                                          color: Hexcolor(myColors.primary2),
                                          fontFamily: "Quicksand"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(LineIcons.info_circle),
                              iconSize: 26.0,
                              color: Hexcolor(myColors.primary2),
                              onPressed: () => print('Save post'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      InkWell(
                        onDoubleTap: () => print('Like post'),
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 0.0, right: 0.0),
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                '${thispost['postimage']}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.favorite),
                                      iconSize: 27.0,
                                      color: Hexcolor('#df136c'),
                                      onPressed: () {
                                        // like post
                                        thispost.reference.updateData(
                                            {"likes": thispost["likes"] + 1});

                                        /* Firestore.instance.runTransaction(
                                            (transaction) async {
                                          DocumentSnapshot freshlike =
                                              await transaction
                                                  .get(thispost.reference);
                                          await transaction
                                              .update(freshlike.reference, {
                                            "likes": freshlike["likes"] + 1,
                                          });
                                        }); */
                                      },
                                    ),
                                    Text(
                                      '${thispost['likes']}',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Hexcolor(myColors.primary2),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Quicksand"),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.0),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(LineIcons.share),
                                      iconSize: 25.0,
                                      color: Hexcolor(myColors.primary2),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      '350',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Quicksand",
                                          color: Hexcolor(myColors.primary2)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(LineIcons.bookmark),
                              iconSize: 26.0,
                              color: Hexcolor(myColors.primary2),
                              onPressed: () => print('Save post'),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 18.0, bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '${thispost['username']} ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0,
                                      color: Hexcolor(myColors.primary2),
                                      fontFamily: "Quicksand"),
                                ),
                                Text(
                                  '${thispost['postdesc']} ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.4,
                                      color: Hexcolor(myColors.primary2),
                                      fontFamily: "Montserrat"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      /*  Divider(
                              height: 10.0,
                            ), */
                      SizedBox(
                        height: 7.0,
                        child: Container(
                          color: Hexcolor('#E7EEFB'),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
