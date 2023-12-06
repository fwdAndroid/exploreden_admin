import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  UserView({Key? key, required this.data}) : super(key: key);

  final QueryDocumentSnapshot<Object?> data;

  @override
  UserViewState createState() => UserViewState();
}

class UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    print(widget.data.id);

// ${widget.data.get('uid')}
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Go Back",
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 500,
                width: 509.55,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                            widget.data.get("photoURL").toString()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text('Name:  ${widget.data.get("name")}'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text('Email:  ${widget.data.get("email")}'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                            'Phone Number:  ${widget.data.get("phoneNumber")}'),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
