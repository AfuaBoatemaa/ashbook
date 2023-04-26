import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_app/functions.dart';
import 'package:social_app/profile.dart';
import 'package:social_app/provider.dart';
import 'package:provider/provider.dart';

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



class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    String mail = Provider.of<MyProvider>(context, listen: false).alt_mail;
    major.text = mail;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 0, 199, 244),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  width: 450,
                  height: 600,
                  child: SingleChildScrollView(
                    child: Column(children: [
                       Text(
                         "View Profile",
                         style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        
                      TextFormField(
                        controller: major,
                        decoration: InputDecoration(
                          hintText: "Major",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      

                      TextFormField(
                        controller: food,
                        decoration: InputDecoration(
                          hintText: "Favorite Food",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                  
                      TextFormField(
                        controller: movie,
                        decoration: InputDecoration(
                          hintText: "Favorite Movie",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: residence,
                        decoration: InputDecoration(
                          hintText: "Residence",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        controller: year,
                        decoration: InputDecoration(
                          hintText: "Yeargroup",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      
                      TextFormField(
                        controller: birth,
                        decoration: InputDecoration(
                          hintText: "Date Of Birth",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  
  
  

