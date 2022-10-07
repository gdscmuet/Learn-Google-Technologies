import 'package:flutter/material.dart';
import 'Colors.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.themeColor,
      body: Stack(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top:30),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.28,
            color: Colors.orange,
          ),
          Container(
            padding: EdgeInsets.only(top: 100, right: 20.0, left: 20.0),
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Text(
                  "My Wallet",
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.white,
                elevation: 4.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
