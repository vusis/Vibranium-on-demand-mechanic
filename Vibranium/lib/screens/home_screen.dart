import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibranium_app/models/user_model.dart';

import 'package:http/http.dart' as http;
import 'package:vibranium_app/screens/user_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {

  final url = "http://localhost:5000/people";

  final _formKey = GlobalKey<FormState>();
  late Map<String,User> theeMap = {
    "text": User(name: "Maria",surname: "Sithole", address: "Katlehong", contact: "0735552222", email: "mar@gmail.com", password: "1234"),
  };
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
      throw Exception("Failed to load Quote");
    }
  }

  @override
  void initState(){
    super.initState();
    futureUser = fetchUsers();
  }


  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff02202e);
    //return Container();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Mechanics"),
        backgroundColor: mainColor,
      ),

      body: FutureBuilder<List<User>>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        onTap: () {
                          //listener needs to come here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserView(
                                      user: listOfUsers[index],
                                    )),
                          );
                        },
                        title: Text(snapshot.data![index].name),
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('assets/spanner.png'),
                        )),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),


    );
  }
}
