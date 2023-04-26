import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'LogIn.dart';
// import 'package:social_app/home.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Row(
            children: [
            Expanded(
              flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 70),
              color: Color.fromARGB(255, 224, 121, 121),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Row(children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  SizedBox(width: 50,),
                  Text("Home")
                ]),
                SizedBox(height: 20,),
                Row(children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(width: 50,),
                  Text("Profile")
                ],),
                Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(width: 50,),
                  Text("Make a Post")
              ]),

            )),
            Expanded(
              flex: 5,
              child: Container(
              color: Colors.white,
              child: Container(
                child: Row(children: [
                  Text(
                    "Firstname: " + firstname.text,
                  ),
                ]),
              ),

            ))
          ],),
        ),
      ),
    );
  }
}
