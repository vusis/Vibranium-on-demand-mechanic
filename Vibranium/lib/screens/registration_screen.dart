import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vibranium_app/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  //controller
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController surnameController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController contactController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff02202e);

    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.text,

      onSaved: (value)
      {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        fillColor: Colors.lime, filled: true,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final surnameField = TextFormField(
      autofocus: false,
      controller: surnameController,
      keyboardType: TextInputType.text,

      onSaved: (value)
      {
        surnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Surname",
        fillColor: Colors.lime, filled: true,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final addressField = TextFormField(
      autofocus: false,
      controller: addressController,
      keyboardType: TextInputType.text,

      onSaved: (value)
      {
        addressController.text = value!;
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

    final contactField = TextFormField(
      autofocus: false,
      controller: contactController,
      keyboardType: TextInputType.phone,

      onSaved: (value)
      {
        contactController.text = value!;
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

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      onSaved: (value)
      {
        emailController.text = value!;
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

    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      color: Colors.lightGreenAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          if(!validateStructure(passwordController.text) || passwordController.text != confirmPasswordController.text
              || ["", null, false, 0].contains(passwordController)
              || ["", null, false, 0].contains(nameController)
              || ["", null, false, 0].contains(emailController)
          ){
            showAlertDialog(context);
          }else{
            registerUser(nameController.text,
                surnameController.text,
                addressController.text,
                contactController.text,
                emailController.text,
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
          title: const Text('Register User'),
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
                      nameField,
                      SizedBox(height: 35,),
                      surnameField,
                      SizedBox(height: 35,),
                      addressField,
                      SizedBox(height: 35,),
                      contactField,
                      SizedBox(height: 35,),
                      emailField,
                      SizedBox(height: 25),
                      passwordField,
                      SizedBox(height: 25),
                      confirmPasswordField,
                      SizedBox(height: 25),
                      registerButton,
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

  Future<http.Response> registerUser(String name,surname,address,cellNumber,email,password) async{
    http.Response response = await http.post(Uri.parse('http://localhost:5000/people'),
    body: jsonEncode(<String, String>{
      'name':name,
      'surname':surname,
      'address':address,
      'cellNumber':cellNumber,
      'email':email,
      'password':password
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
