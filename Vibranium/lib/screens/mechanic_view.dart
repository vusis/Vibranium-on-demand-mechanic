import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vibranium_app/models/company_model.dart';

class MechanicView extends StatefulWidget {
  const MechanicView({Key? key,required this.company}) : super(key: key);

  final Company company;
  @override
  _MechanicViewState createState() => _MechanicViewState();
}

class _MechanicViewState extends State<MechanicView> {

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff02202e);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechanics'),
        backgroundColor: mainColor,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("${widget.company.getCompanyName} mechanic from ${widget.company.companyAddress}")),

    );
  }
}
