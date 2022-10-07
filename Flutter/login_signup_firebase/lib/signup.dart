import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_signup/homepage.dart';
import 'package:login_signup/login.dart';
import 'Colors.dart';
import 'mainscreen.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  static Future<User?> SignUpUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("NO User found for that email");
      }
    }
    return user;
  }
  String inputemail="";
  late TextEditingController _emailcontroller;
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  bool _ShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.themeColor,
        body: Stack(
          children: [
            const Align(
              alignment: AlignmentDirectional(0.00, -0.75),
              child: Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 40, color: Colors.white, fontFamily: 'Raleway'),
              ),
            ),
            Center(
              child: Container(
                constraints:
                    const BoxConstraints(maxHeight: 380, maxWidth: 280),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(-2, 0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(2, 0),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 12, right: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.textfield.withOpacity(0.25),
                          prefixIcon: const Icon(Icons.account_circle),
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 12, right: 12),
                      child: TextField(
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.textfield.withOpacity(0.25),
                          prefixIcon: const Icon(Icons.email_rounded),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 12, right: 12),
                      child: TextField(
                        controller: _passwordcontroller,
                        obscureText: !_ShowPassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.textfield.withOpacity(0.25),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _ShowPassword ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _ShowPassword = !_ShowPassword;
                                },
                              );
                            },
                          ),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      color: theme.button,
                      onPressed: () async {
                        User? user = await SignUpUsingEmailPassword(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text,
                            context: context);
                        print(user);
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Loginpage()));
                        }
                      },
                      borderRadius: BorderRadius.circular(40),
                      child: const Text("SIGNUP"),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        setState(() {
                          inputemail = _emailcontroller.text;
                        });
                        print(inputemail);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homepage()));
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: theme.button,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
