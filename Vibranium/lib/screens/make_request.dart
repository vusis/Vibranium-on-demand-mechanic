import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vibranium_app/models/user_model.dart';
import 'package:vibranium_app/screens/registration_screen.dart';

import 'package:http/http.dart' as http;
import 'package:vibranium_app/screens/home_screen.dart';

import 'available_mechanics.dart';

class MakeRequestScreen extends StatefulWidget {
  const MakeRequestScreen({Key? key}) : super(key: key);

  @override
  _MakeRequestScreenState createState() => _MakeRequestScreenState();
}

class _MakeRequestScreenState extends State<MakeRequestScreen> {

  final _formKey = GlobalKey<FormState>();
  final url = "http://localhost:5000/login";

  late Future<List<User>> futureUser;
  List<User> listOfUsers=[];

  Future<List<User>> fetchUsers() async{

    final response = await http.get(Uri.parse(url));
    var jsonData =jsonDecode(response.body);


    // Check if request was  successful and if yes add each quote to the listOfQuotes
    if(response.statusCode == 200){
      for(var user in jsonData){
        User userInstance = User.fromJson(user);
        listOfUsers.add(userInstance);
      }
      return listOfUsers;

    }else {
      throw Exception("Failed to load Users");
    }
  }

  //controller
  final TextEditingController locationController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff02202e);

    final locationField = TextFormField(
      autofocus: false,
      controller: locationController,
      keyboardType: TextInputType.text,

      onSaved: (value)
      {
        locationController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_on_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Location",
        fillColor: Colors.lime, filled: true,
        //focusColor: Colors.lightGreenAccent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );



    final requestButton = Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      color: Colors.lightGreenAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          // if(listOfUsers.length == 0){
          //   shoAlertDialog(context);
          // }
          _sendDataToSecondScreen(context);
        },
        child: Text("Request",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color:Colors.blueAccent, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          title: const Text("Make a request"),
          backgroundColor: mainColor,
        ),
        body: Center(
          child: SingleChildScrollView (
            child: Container(
              color: mainColor,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 400,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(height: 35,),
                      locationField,
                      SizedBox(height: 25),
                      requestButton,
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );

  }

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = locationController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AvailableMechanicView(location: textToSend,),
        ));
    //Navigator.push(context, MaterialPageRoute(builder: (context) => AvailableMechanicView()));
  }

  shoAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {  Navigator.pop(context,"OK");},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("Enter correct username and password" ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
