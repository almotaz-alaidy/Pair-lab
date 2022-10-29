import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lap/screens/deatails.dart';

import 'component/ubdate.dart';

List<Color> MyColor = [Colors.red, Colors.blue];
CollectionReference myRef = FirebaseFirestore.instance.collection("userType");
String myValue = "admin";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: MyColor)),
        child: ListView(children: [
          RadioListTile(
              secondary: Icon(Icons.person),
              title: Text("user"),
              value: "user",
              groupValue: myValue,
              onChanged: ((val) {
                setState(() {
                  myValue = val.toString();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(),
                      ));
                  FirebaseCrud.updateInfo(
                      id: "id", docId: "iPBucJg0PgZOucs4BMhI", type: myValue);
                });
              })),
          RadioListTile(
              secondary: Icon(Icons.person),
              title: Text("admin"),
              subtitle: Text(""),
              value: "admin",
              groupValue: myValue,
              onChanged: ((val) {
                setState(() {
                  myValue = val.toString();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(),
                      ));
                  FirebaseCrud.updateInfo(
                      id: "id", docId: "iPBucJg0PgZOucs4BMhI", type: myValue);
                });
              })),
        ]),
      ),
    );
  }
}
