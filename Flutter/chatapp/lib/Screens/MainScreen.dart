import 'package:chatapp/Screens/signin.dart';
import 'package:chatapp/Screens/signup.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/imagebg.jpg"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: ListView(
              children: [
                SizedBox(
                  height: 270,
                ),
                Text(
                  "Chat App",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Secure, Reliable and Fast",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                     Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (BuildContext context) => const Signin(),
             ),);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    width: 325,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                     Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (BuildContext context) => const Signup(),
             ),);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    width: 325,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
