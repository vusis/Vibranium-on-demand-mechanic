import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vibranium_app/screens/available_mechanics.dart';

import 'login_screen.dart';

class RegisterMechanicScreen extends StatefulWidget {
  const RegisterMechanicScreen({Key? key}) : super(key: key);

  @override
  _RegisterMechanicScreenState createState() => _RegisterMechanicScreenState();
}

class _RegisterMechanicScreenState extends State<RegisterMechanicScreen> {
  final _formKey = GlobalKey<FormState>();

  //controller
  final TextEditingController companyNameController = new TextEditingController();
  final TextEditingController companyAddressController = new TextEditingController();
  final TextEditingController companyTelController = new TextEditingController();
  final TextEditingController companyEmailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // "Vusi", "Sithole","Johannesburg","0736863806")

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff02202e);

    final companyNameField = TextFormField(
      autofocus: false,
      controller: companyNameController,
      keyboardType: TextInputType.text,

      onSaved: (value)
      {
        companyNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.corporate_fare_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Company Name",
        fillColor: Colors.lime, filled: true,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    final companyAddressField = TextFormField(
      autofocus: false,
      controller: companyAddressController,
      keyboardType: TextInputType.text,

      onSaved: (value)
      {
        companyAddressController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.home_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Address",
        fillColor: Colors.lime, filled: true,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final companyTelField = TextFormField(
      autofocus: false,
      controller: companyTelController,
      keyboardType: TextInputType.phone,

      onSaved: (value)
      {
        companyTelController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Contact",
        fillColor: Colors.lime, filled: true,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final companyEmailField = TextFormField(
      autofocus: false,
      controller: companyEmailController,
      keyboardType: TextInputType.emailAddress,

      onSaved: (value)
      {
        companyEmailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        fillColor: Colors.lime, filled: true,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      //keyboardType: TextInputType.done,

      onSaved: (value)
      {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        fillColor: Colors.lime, filled: true,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      //keyboardType: TextInputType.done,

      onSaved: (value)
      {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        fillColor: Colors.lime, filled: true,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );

    final registerCompanyButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      color: Colors.lightGreenAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          if( !validateStructure(passwordController.text)||
              passwordController.text != confirmPasswordController.text
              ||["", null, false, 0].contains(passwordController)
              || ["", null, false, 0].contains(companyNameController)
              || ["", null, false, 0].contains(companyEmailController)
              || ["", null, false, 0].contains(companyAddressController)
          ){
            showAlertDialog(context);
          }else{
            registerCompany(companyNameController.text,
                companyAddressController.text,
                companyTelController.text,
                companyEmailController.text,
                passwordController.text);
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            }
        },
        child: Text("Register",
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
          title: const Text('Register Mechanics'),
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
                      companyNameField,
                      SizedBox(height: 35,),
                      companyAddressField,
                      SizedBox(height: 35,),
                      companyTelField,
                      SizedBox(height: 35,),
                      companyEmailField,
                      SizedBox(height: 25),
                      passwordField,
                      SizedBox(height: 25),
                      confirmPasswordField,
                      SizedBox(height: 25),
                      registerCompanyButton,
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

  Future<http.Response> registerCompany(String companyName,companyAddress,companyTel,companyEmail,password) async{
    http.Response response = await http.post(Uri.parse('http://localhost:5000/company'),
    body: jsonEncode(<String, String>{
      'companyName': companyName,
      'companyAddress': companyAddress,
      'companyTel': companyTel,
      'companyEmail': companyEmail,
      'password': password
    }));
    if(response.statusCode == 201){
      //Navigator.push(context, MaterialPageRoute(builder: (context) => AvailableMechanicView()));
      log("passed");
    }else{
      log("we couldnt");
    }

    return response;
  }

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {  Navigator.pop(context,"OK");},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("Make sure your password match and don't leave black fields"),
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