import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_app/Posts.dart';
import 'package:social_app/functions.dart';
import 'package:social_app/profile.dart';


TextEditingController email = TextEditingController();
TextEditingController posts = TextEditingController();


class Createpost extends StatelessWidget {
  const Createpost({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(
          //   title: Text(''),
          // ),
          body: Container(
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
                    color: Color.fromARGB(255, 251, 252, 252),
                    width: 650,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Text(
                          "SHARE A POST",
                         style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: posts,
                            decoration: InputDecoration(
                              hintText: "What is on your mind?",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 45,),
                          ElevatedButton(
                              onPressed: () {
                                  post(context, {
                                    "Email": email.text,
                                    "What is on your mind?": posts.text
                                  });
                              },
                              child: Text("Share"))
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
