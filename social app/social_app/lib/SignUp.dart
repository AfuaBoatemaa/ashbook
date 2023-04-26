import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_app/Posts.dart';
import 'package:social_app/functions.dart';
import 'package:social_app/profile.dart';

import 'LogIn.dart';

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
TextEditingController pass = TextEditingController();
// TextEditingController gender = TextEditingController();

class SignUP extends StatelessWidget {
  const SignUP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('AshBook'),
          ),
          body: Container(
            color: Color.fromARGB(255, 0, 199, 244),
            // decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/images/picture.jpg"),
                    //fit: BoxFit.cover)),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Color.fromARGB(255, 248, 248, 248),
                    width: 500,
                    height: 600,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Text(
                          "SIGN UP",
                         style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: firstname,
                          decoration: InputDecoration(
                            hintText: "Firstname",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: lastname,
                          decoration: InputDecoration(
                            hintText: "Lastname",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: birth,
                          decoration: InputDecoration(
                            hintText: "Date Of Birth",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: pass,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: id,
                          decoration: InputDecoration(
                            hintText: "ID",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: major,
                          decoration: InputDecoration(
                            hintText: "Major",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: year,
                          decoration: InputDecoration(
                            hintText: "Year group",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: food,
                          decoration: InputDecoration(
                            hintText: "Favorite Food",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: movie,
                          decoration: InputDecoration(
                            hintText: "Favorite Movie",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: residence,
                          decoration: InputDecoration(
                            hintText: "Residence",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              
                              register(
                                {
                                  "Firstname": firstname.text,
                                  "Lastname": lastname.text,
                                  "DOB": birth.text,
                                  "Yeargroup": year.text,
                                  "Major": major.text,
                                  "Residence": residence.text,
                                  "Favorite_food": food.text,
                                  "Favorite_movie": movie.text,
                                  "Email": email.text,
                                  "StudentID": id.text,
                                  "Password": pass.text
                                },
                              ).then((value) {
                              

                              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostsPage()),
                    );
                    });
                            },
                            child: Text("Create Profile"))
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
