import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Details extends StatefulWidget {
  const Details({super.key});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: myRef.snapshots(),
      builder: (BuildContext context, snapshot) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, i) {
                return Column(children: [
                  Text(FirebaseAuth.instance.currentUser!.email!),
                  Text(snapshot.data!.docs[i]["type"].toString()),
                  Text(snapshot.data!.docs[i]["id"].toString()),
                ]);
              },
            ),
          ),
        );
      },
    );
  }
}
