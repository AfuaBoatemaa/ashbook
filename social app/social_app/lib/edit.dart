import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_app/ViewProfile.dart';
import 'package:social_app/functions.dart';
// import 'package:social_app/home.dart';
import 'package:social_app/provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Posts.dart';

TextEditingController year = TextEditingController();
TextEditingController major = TextEditingController();
TextEditingController food = TextEditingController();
TextEditingController movie = TextEditingController();
TextEditingController residence = TextEditingController();
TextEditingController birth = TextEditingController();

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    String mail = Provider.of<MyProvider>(context, listen: false).alt_mail;
    Future<void> view(BuildContext context, mail) async {
      var url = Uri.http("127.0.0.1:5000", '/students', {"Email": mail});

      var req = await http.get(url, headers: header);
      print(req.statusCode);
      final body = jsonDecode(req.body);


      if (req.statusCode == 200) {
        year.text = body['Yeargroup'];
        major.text = body['Major'];
        food.text = body['Favorite_food'];
        movie.text = body['Favorite_movie'];
        residence.text = body['Residence'];
        birth.text = body['DOB'];
        
      }
    }
    view(context, mail);
    // print(body['Major']);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          // color: Colors.blue,
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
                        "View/Edit Profile",
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
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostsPage()),
                            );
                            edit(
                              context,
                              {
                                "DOB": birth.text,
                                "Yeargroup": year.text,
                                "Major": major.text,
                                "Residence": residence.text,
                                "Favorite_food": food.text,
                                "Favorite_movie": movie.text,
                                "Email": mail
                              },
                            );
                          },
                          child: Text("Edit Profile"))
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
