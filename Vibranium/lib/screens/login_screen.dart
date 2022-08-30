import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vibranium_app/models/user_model.dart';
import 'package:vibranium_app/screens/make_request.dart';
import 'package:vibranium_app/screens/register_mechanic_screen.dart';
import 'package:vibranium_app/screens/registration_screen.dart';

import 'package:http/http.dart' as http;
import 'package:vibranium_app/screens/home_screen.dart';

import 'available_mechanics.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  late Future<List<User>> futureUser;

  //controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff02202e);

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      onSaved: (value)
      {
        //emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        fillColor: Colors.lime, filled: true,
        //focusColor: Colors.lightGreenAccent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      //keyboardType: TextInputType.phone,

      onSaved: (value)
      {
        //passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        fillColor: Colors.lime, filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );

    final loginButton = Material(


      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      color: Colors.lightGreenAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async{
          http.Response response;

          response = await loginStatus(emailController.text, passwordController.text);

          if(response.statusCode == 202){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MakeRequestScreen()));
            passwordController.clear();
            emailController.clear();
          }else{
            shoAlertDialog(context);
          }
        },
        child: Text("Login",
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20, color:Colors.blueAccent, fontWeight: FontWeight.bold
            ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: mainColor,
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
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 25),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? ",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        GestureDetector(
                          onTap: ( ) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.blueAccent, fontWeight: FontWeight.w400, fontSize: 15
                            ),
                          ),
                        ),
                        Text(" or ",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        GestureDetector(
                          onTap: ( ) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterMechanicScreen()));
                          },
                          child: Text(
                            "Register Mechanic",
                            style: TextStyle(
                                color: Colors.blueAccent, fontWeight: FontWeight.w400, fontSize: 15
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );

  }

  Future<http.Response> loginStatus(String email, password) async{

    http.Response response = await http.post(Uri.parse('http://localhost:5000/login'),
        body: jsonEncode(<String, String>{
          'email':email,
          'password':password
        }));

    return response;

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
