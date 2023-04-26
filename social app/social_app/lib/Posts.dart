import 'dart:js';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:social_app/LogIn.dart';
import 'package:social_app/ViewProfile.dart';
import 'package:social_app/createpost.dart';
import 'package:social_app/edit.dart';
import 'package:social_app/functions.dart';
import 'package:social_app/provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  Stream<QuerySnapshot> myStream =
      FirebaseFirestore.instance.collection('Posts').snapshots();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String firstname =
        Provider.of<MyProvider>(context, listen: false).alt_firstname;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('AshBook'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Posts'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Posts'),
        actions: [
          Container(
            height: 10.0,
            width: 70.0,
            margin: EdgeInsets.only(right: 50, top: 8, bottom: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // showCreateModal(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Createpost()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.transparent,
                  ),
                  child: Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Icon(
                //   Icons.add,
                //   color: Colors.grey[500],
                //   size: 20,
                // ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
            stream: myStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData) {
                return Center(
                  child: const CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                );
              }
              final list = snapshot.data!.docs;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Text(
                        "Hi " + firstname + ", New Activity",
                        style: TextStyle(fontSize: 30, color: Colors.blue),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    for (var post in list.reversed)
                      newFeed(context, post['Email'],
                          post['What is on your mind?'], "time"),
                    // SizedBox(height: 20,),

                    // SizedBox(height: 20,),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class Post {
//   final String title;
//   final String body;

//   Post(this.title, this.body);
// }

// class PostsPage extends StatelessWidget {
//   final List<Post> posts = [
//     Post('Post 1', 'This is the body of post 1.'),
//     Post('Post 2', 'This is the body of post 2.'),
//     Post('Post 3', 'This is the body of post 3.'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     String firstname =
//         Provider.of<MyProvider>(context, listen: false).alt_firstname;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts'),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(40),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             "Hi, " + firstname + ", New Posts",
//             style: TextStyle(
//                 color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             padding: EdgeInsets.all(20),
//             // width: 700,
//             height: 300,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.grey[200],
//             ),
//             child: Column(children: [
//               Row(
//                 children: [
//                   Text(
//                     "boatemaa@yahoo.com",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     " made a post",
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 14,
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height:30),
//               Text(
//                 "DUE TODAY!!!",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               )
//             ]),
//           )
//         ]),
//       ),
//     );
//   }
// }
