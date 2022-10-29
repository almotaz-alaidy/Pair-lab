import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.myController,
      required this.myHint,
      required this.myLabel});
  TextEditingController? myController;
  String? myLabel;
  String? myHint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: '$myLabel',
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),
          hintText: '$myHint',
          hintStyle: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
