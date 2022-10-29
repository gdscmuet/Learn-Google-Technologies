import 'package:chatapp/Screens/MainScreen.dart';
import 'package:chatapp/Screens/chattingscreen.dart';
import 'package:chatapp/Screens/signin.dart';
import 'package:chatapp/Screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class MyApp extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("Error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,  
            home: MainScreen(),
          routes: {
            "/SignIn" : (context) => Signin(),
            "/SignUp" : (context) => Signup(),
            "/home" : (context) => MainScreen()
          }, 

          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Wait");
      },
    );
  }
}