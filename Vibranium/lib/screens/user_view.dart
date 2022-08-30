import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vibranium_app/models/user_model.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key,required this.user}) : super(key: key);

  final User user;
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff02202e);
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: const Text('User'),
        backgroundColor: mainColor,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("${widget.user.getName} mechanic from ${widget.user.getAddress}")),

    );
  }
}
