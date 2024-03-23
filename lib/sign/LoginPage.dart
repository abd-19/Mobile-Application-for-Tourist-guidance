// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sized_box_for_whitespace, use_key_in_widget_constructors, library_private_types_in_public_api, file_names, unused_local_variable

import 'package:app/sign/SignUpPage.dart';
import 'package:app/welcome_page/introScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/admin/adminpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 870,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff1e1e1e)),
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 800,
                  child: Align(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Opacity(
                        opacity: 1,
                        child: Image.asset(
                          'images/carry-bag-7-svgrepo-com.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 102,
                  top: 90,
                  child: Align(
                    child: SizedBox(
                      width: 400,
                      height: 200,
                      child: Image.asset(
                        'images/login-user-profile-account-password-logout-svgrepo-com.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 100, 0, 0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff008fa0),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 232,
                  child: Align(
                    child: SizedBox(
                      width: 349,
                      height: 550,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff008fa0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 8, 100)),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 29),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff008fa0)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 8, 2),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                          fontFamily: 'PT Sans',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff585858),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      'images/email.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff008fa0)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 6, 8, 0),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          fontFamily: 'PT Sans',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff585858),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      'images/password.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(9, 111, 0, 0),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 42),
                                    width: double.infinity,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Align(
                                            child: SizedBox(
                                              width: 329,
                                              height: 46,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  await _signInWithEmailAndPassword();
                                                },
                                                child: Ink(                                               
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 245, 246, 246),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Sign In',
                                                      style: TextStyle(
                                                        fontFamily: 'PT Sans',
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff585858),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffffffff),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Don’t have an Account? ',
                                          style: TextStyle(
                                            fontFamily: 'PT Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Sign up here',
                                          style: TextStyle(
                                            fontFamily: 'PT Sans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xffffffff),
                                            decorationColor: Color(0xffffffff),
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignUpPage()),
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isLoading) CircularProgressIndicator(),
        ],
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      if (_isUserAdmin()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => introScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred";
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
      showErrorSnackbar(context, errorMessage);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool _isUserAdmin() {
    String enteredEmail = emailController.text;
    String enteredPassword = passwordController.text;
    return enteredEmail == "admin@gmail.com" && enteredPassword == "adminadmin";
  }

  void showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  }
}
