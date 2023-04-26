import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_app/Posts.dart';
import 'package:social_app/edit.dart';
import 'package:social_app/functions.dart';
import 'package:social_app/profile.dart';

import 'package:provider/provider.dart';
import 'package:social_app/provider.dart';

TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController year = TextEditingController();
TextEditingController major = TextEditingController();
TextEditingController food = TextEditingController();
TextEditingController movie = TextEditingController();
TextEditingController residence = TextEditingController();
TextEditingController id = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController birth = TextEditingController();
TextEditingController gender = TextEditingController();
TextEditingController pass = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String mail= Provider.of<MyProvider>(context, listen: false).alt_mail;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('AshBook'),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  color: Color.fromARGB(255, 0, 199, 244),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("lib/images/picture.jpeg"),
                  //         fit: BoxFit.cover)),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Color.fromARGB(255, 245, 245, 245),
                    width: 500,
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Text(
                          "LOG IN",
                         style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: pass,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            onPressed: () {
                                Login(context, {
                                  "Email": email.text,
                                  "Password": pass.text
                                });
                            },
                            child: Text("Submit"))
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
