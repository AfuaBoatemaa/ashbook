import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_app/LogIn.dart';
import 'package:social_app/Posts.dart';
import 'package:social_app/SignUp.dart';
import 'package:social_app/edit.dart';
// import 'package:social_app/home.dart';
import 'package:social_app/profile.dart';
import 'package:social_app/provider.dart';
import 'package:provider/provider.dart';

var header = {'Content-Type': 'application/json'};

//function for registration
Future register(values) async {
  var url = Uri.https("final-project-a1903.uc.r.appspot.com", '/students');

  var req = await http.post(url, headers: header, body: jsonEncode(values));
  // print(req.statusCode);

  return req.body;
}

//function for editing a page
Future<void> Update(BuildContext context, values) async {
  var url = Uri.https("final-project-a1903.uc.r.appspot.com", '/students');

  var req = await http.patch(url, headers: header, body: jsonEncode(values));
  print(req.statusCode);

  if (req.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditPage()),
    );
  }
}

//Function for viewing profile
Future<dynamic> view(BuildContext context, mail) async {
  var url = Uri.https("final-project-a1903.uc.r.appspot.com", '/students', {"Email": mail});

  var req = await http.get(url, headers: header);
  print(req.statusCode);

  if (req.statusCode == 200) {
    return jsonDecode(req.body);
  }
}

//Login function
Future<void> Login(BuildContext context, data) async {
  var url = Uri.https("final-project-a1903.uc.r.appspot.com", "/login");
  var request = await http.post(
    url,
    headers: header,
    body: jsonEncode(data),
  );

  print(request.statusCode);

  var responseBody = jsonDecode(request.body);
  if (!responseBody["Success"]) {
    print("Wrong Email or Password");
  }

  if (responseBody["Success"]) {
    Provider.of<MyProvider>(context, listen: false).alt_mail =
        responseBody["Email"];

    Provider.of<MyProvider>(context, listen: false).alt_DOB =
        responseBody["DOB"];

    Provider.of<MyProvider>(context, listen: false).alt_firstname =
        responseBody["Firstname"];

    Provider.of<MyProvider>(context, listen: false).alt_lastname =
        responseBody["Lastname"];

    Provider.of<MyProvider>(context, listen: false).alt_major =
        responseBody["Major"];

    Provider.of<MyProvider>(context, listen: false).alt_residence =
        responseBody["Residence"];

    Provider.of<MyProvider>(context, listen: false).alt_food =
        responseBody["Favorite_food"];

    Provider.of<MyProvider>(context, listen: false).alt_movie =
        responseBody["Favorite_movie"];

    Provider.of<MyProvider>(context, listen: false).alt_yeargroup =
        responseBody["Yeargroup"];

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PostsPage()));
  } else {
    print("Wrong Password");
  }
}

newFeed(context, email, post, time) {
  return Container(
    padding: EdgeInsets.all(20),
    // width: 700,
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey[200],
    ),
    child: Column(children: [
      Row(
        children: [
          Text(
            email,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
          Text(
            " made a post",
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          )
        ],
      ),
      SizedBox(height: 30),
      Text(
        post,
        style: TextStyle(
          fontSize: 20,
        ),
      )
    ]),
  );
}

Future<void> post(BuildContext context, values) async {
  var url = Uri.https("final-project-a1903.uc.r.appspot.com", '/posts');

  var req = await http.post(url, headers: header, body: jsonEncode(values));
  print(req.statusCode);

  if (req.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostsPage()),
    );
  }
}

Future<void> edit(BuildContext context, values) async {
  var url = Uri.https("final-project-a1903.uc.r.appspot.com", '/students');

  var req = await http.patch(url, headers: header, body: jsonEncode(values));
  print(req.statusCode);

  if (req.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostsPage()),
    );
  }
}