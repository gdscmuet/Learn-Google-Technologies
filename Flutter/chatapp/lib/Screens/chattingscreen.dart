import 'package:chatapp/Models/Model.dart';
import 'package:chatapp/Screens/UserProfile.dart';
import 'package:chatapp/Screens/signin.dart';
import 'package:chatapp/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatingScreen extends StatefulWidget {
  const ChatingScreen({Key? key}) : super(key: key);

  @override
  _ChatingScreenState createState() => _ChatingScreenState();
}

class _ChatingScreenState extends State<ChatingScreen> {
  void data() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Chat App",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Colors.black87,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                  },
                  child: Icon(Icons.person)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Signin(),
                      ),
                    );
                  },
                  child: Icon(Icons.logout)),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey),
          child: ListView(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.search),
                      hintText: "Search"),
                ),
                decoration: BoxDecoration(color: Colors.grey),
              ),
              SizedBox(
                height: 6,
              ),
              profiles()
            ],
          ),
        ),
      ),
    );
  }
}
