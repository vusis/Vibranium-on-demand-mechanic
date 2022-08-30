import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibranium_app/models/company_model.dart';
import 'package:vibranium_app/models/user_model.dart';

import 'package:http/http.dart' as http;
import 'package:vibranium_app/screens/user_view.dart';

import 'mechanic_view.dart';

class AvailableMechanicView extends StatefulWidget {
  final String location;

  const AvailableMechanicView({Key? key, required this.location}) : super(key: key);

  @override
  _AvailableMechanicViewState createState() => _AvailableMechanicViewState(location);

}

class _AvailableMechanicViewState extends State<AvailableMechanicView> {
  String location = '';
  _AvailableMechanicViewState(this.location);

  final url = "http://localhost:5000/company/";

  final _formKey = GlobalKey<FormState>();
  late Map<String,Company> theeMap = {
    "text": Company(companyName: "companyName", companyAddress: "companyAddress", companyTel: "companyTel", companyEmail: "companyEmail", password: "password"),
  };
  late Future<List<Company>> futureMechanic;

  List<Company> listOfCompanies=[];

  Future<List<Company>> fetchMechanics() async{

    final response = await http.get(Uri.parse(url+location));
    var jsonData =jsonDecode(response.body);

    if(response.statusCode == 200){
      for(var mechanic in jsonData){
        Company mechanicInstance = Company.fromJson(mechanic);
        listOfCompanies.add(mechanicInstance);
      }
      return listOfCompanies;

    }else {
      throw Exception("Failed to fetch mechanics");
    }
  }

  @override
  void initState(){
    super.initState();
    futureMechanic = fetchMechanics();
  }


  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff02202e);
    //return Container();
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: const Text("Available Mechanics"),
        backgroundColor: mainColor,
      ),
      body: FutureBuilder<List<Company>>(
        future: futureMechanic,
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
                                builder: (context) => MechanicView(
                                  company: listOfCompanies[index],
                                )),
                          );
                        },
                        title: Text(snapshot.data![index].companyName),
                        //title: Text("Vee"),
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
