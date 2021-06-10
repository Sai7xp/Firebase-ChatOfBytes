import 'dart:io';
import 'dart:math' as Rand;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_blog/pages/homescreen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_blog/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

class UploadPost extends StatefulWidget {
  UploadPost({Key key}) : super(key: key);

  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formkey = new GlobalKey<FormState>();
  bool btnenable = true;
  TextEditingController _controller = TextEditingController();
  // String filename =
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text(
              'Please Confirm !',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Quicksand",
                  color: Hexcolor(myColors.pinkish)),
            ),
            backgroundColor: Colors.white,
            content: Text(
              'Are you sure to cancel upload ?',
              style: TextStyle(
                  fontFamily: "Quicksand", color: Hexcolor(myColors.primary)),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      color: Hexcolor(myColors.primary)),
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Yes',
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      color: Hexcolor(myColors.primary)),
                ),
              )
            ],
          ),
        ) ??
        false;
  }

  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
    setState(() {
      _image = image;
    });
  }

  Future storeimage(_image, caption) async {
    int likes = 0;
    int custom = new Rand.Random().nextInt(999999);
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child('posts/$userid/$custom.jpg');
    final StorageUploadTask storageUploadTask =
        storageReference.putFile(_image);
    var posturl =
        await (await storageUploadTask.onComplete).ref.getDownloadURL();

    Firestore.instance.collection('/newPosts').add({
      "username": username,
      "usermail": usermail,
      "postimage": posturl,
      "postdesc": caption,
      "userid": userid,
      "userimage": userimage,
      "timestamp":DateTime.now().millisecondsSinceEpoch.toString(),
      "likes":likes
    }).then((error) {
      Fluttertoast.showToast(
          msg: "Posted Successfully!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Hexcolor(myColors.primary2),
          elevation: 0,
          title: Text(
            "Upload Post",
            style: TextStyle(fontFamily: "Quicksand"),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Choose your image:",
                style: TextStyle(
                    color: Hexcolor("#8c8382"),
                    fontSize: 18.0,
                    fontFamily: "QuickSand",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: GestureDetector(
                  onTap: getImage,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: _image == null
                            ? AssetImage(
                                "assets/images/dummy.png",
                              )
                            : FileImage(
                                _image,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autovalidate: true,
                enableSuggestions: true,
                validator: (value) => value.isEmpty ? 'Enter your caption!' : null,
                controller: _controller,
                cursorColor: Hexcolor(myColors.primary),
                style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 16.0,
                    color: Hexcolor(myColors.primary)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Write a caption..",
                  focusColor: Hexcolor(myColors.secondary),
                  fillColor: Hexcolor(myColors.secondary),
                  hintStyle: TextStyle(fontFamily: "Quicksand", fontSize: 14.0),
                  labelText: "Description",
                  hoverColor: Hexcolor(myColors.primary),
                ),
                maxLength: 34,
              ),
              SizedBox(height: 26.0),
              Container(
                height: 44.0,
                width: MediaQuery.of(context).size.width / 2.7,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0),
                  ),
                  onPressed: _image != null
                      ? () {
                          if (btnenable) {
                            sharepost();
                          }
                        }
                      : null,
                  child: Text('Share Post',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                      )),
                  color: Hexcolor(myColors.primary2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void sharepost() {
    setState(() {
      btnenable = false;
    });
    String caption = _controller.text;

    if (caption != null) {
      Fluttertoast.showToast(
          msg: "Your post will be live soon!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER);
      Navigator.of(context).pop();
      print("kljhjd");
      storeimage(_image, caption).then((value) {});
    } else {
      Fluttertoast.showToast(
          msg: "Write your caption!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER);
    }
  }
}
