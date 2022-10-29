import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lap/screens/signin.dart';
import 'package:line_icons/line_icons.dart';

import '../wedget/MyTextField.dart';

class Singub extends StatefulWidget {
  const Singub({super.key});

  @override
  State<Singub> createState() => _SingubState();
}

class _SingubState extends State<Singub> {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conPass = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Singub page"),
        backgroundColor: Color.fromARGB(255, 194, 135, 93),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.mmppicture.co.in/wp-content/uploads/2020/09/Background-1-802x1080.jpg"),
              fit: BoxFit.fill),
        ),
        child: ListView(children: [
          SizedBox(
            height: 60,
          ),
          MyTextField(
              myController: name,
              myHint: "enter yore name",
              myLabel: "youre name"),
          SizedBox(
            height: 60,
          ),
          MyTextField(
              myController: email,
              myHint: "enter yore email",
              myLabel: "youre email"),
          SizedBox(
            height: 60,
          ),
          TextField(
            obscureText: showPassword,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                prefixIcon: const Icon(LineIcons.doubleCheck),
                hintText: 'enter youre pass',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'youre pass',
                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                hintStyle: TextStyle(color: Colors.white, fontSize: 20)),
            controller: pass,
          ),

          SizedBox(
            height: 60,
          ),
          TextField(
            obscureText: showPassword,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                prefixIcon: const Icon(LineIcons.doubleCheck),
                hintText: 'Confirm password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'youre pass again',
                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                hintStyle: TextStyle(color: Colors.white, fontSize: 20)),
            controller: conPass,
          ),
          // Confirm password

          Divider(
            height: 30,
          ),
          TextButton(
            onPressed: () async {
              try {
                var authin = FirebaseAuth.instance;
                UserCredential user =
                    await authin.createUserWithEmailAndPassword(
                        email: email.text, password: pass.text);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("its added")));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text("sorry try to change the pass and the email")));
              }
            },
            child: Text(
              "Sin gub",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Divider(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Sign_In();
                },
              ));
            },
            child: Text(
              "sign in",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
