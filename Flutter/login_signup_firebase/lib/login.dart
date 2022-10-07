import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/signup.dart';
import 'Colors.dart';
import 'forgotpassword.dart';
import 'mainscreen.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final TextEditingController _Emailcontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();

  String inputemail="";
  
  static Future<User?> loginUsingEmailPassword(
      {required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("NO User found for that email");
      }
    }
    return user;
  }

  @override
  void dispose() {
    _Emailcontroller.dispose();
    _Passwordcontroller.dispose();
    super.dispose();
  }


  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor:  theme.themeColor,
        body: Stack(
          children: [
            const Align(
              alignment: AlignmentDirectional(0.00, -0.80),
              child: Text(
                'WELCOME',
                style: TextStyle(
                    fontSize: 40, color: Colors.white, fontFamily: 'Raleway'),
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(0.00, -0.65),
              child: Text(
                'BACK',
                style: TextStyle(
                    fontSize: 40, color: Colors.white, fontFamily: 'Raleway'),
              ),
            ),
            Center(
              child: Container(
                constraints:
                const BoxConstraints(maxHeight: 320, maxWidth: 280),
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
                        controller: _Emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                          theme.textfield.withOpacity(0.25),
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
                        controller: _Passwordcontroller,
                        obscureText: !_showPassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                          theme.textfield.withOpacity(0.25),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _showPassword ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () {
                              setState(
                                    () {
                                  _showPassword = !_showPassword;
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
                    CupertinoButton(
                      padding: EdgeInsets.all(0.1),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const forgotpassword()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      color:   theme.button,
                      onPressed: () async {
                        inputemail = _Emailcontroller.text;
                        User? user = await loginUsingEmailPassword(
                            email:inputemail,
                            password: _Passwordcontroller.text,
                            context: context);
                        print(user);
                        if(user!=null)
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const mainscreen()));
                        }
                      },
                      borderRadius: BorderRadius.circular(40),
                      child: const Text("LOGIN"),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const signup()));
                      },
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(
                          color:   theme.button,
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