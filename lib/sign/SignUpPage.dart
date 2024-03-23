// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sized_box_for_whitespace, use_key_in_widget_constructors, library_private_types_in_public_api, file_names, unused_local_variable, deprecated_member_use

import 'package:app/sign/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 870,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff1e1e1e)),
                color: Color(0xff008fa0),
              ),
              child: Stack(
                children: [
                  
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 100, 0, 0),
                    child: Text(
                      'Let\'s start your \n journey together!',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 232, 234, 234),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 232,
                    child: Align(
                      child: SizedBox(
                        width: 349,
                        height: 600,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 238, 240, 241),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildTextField(
                                controller: firstnameController,
                                hintText: 'First Name',
                                imageAsset: 'images/username.jpg',
                                margin: EdgeInsets.fromLTRB(10, 80, 10, 25),
                              ),
                              buildTextField(
                                controller: lastnameController,
                                hintText: 'Last Name',
                                imageAsset: 'images/username.jpg',
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 8, 20)),
                              buildTextField(
                                controller: emailController,
                                hintText: 'Email',
                                imageAsset: 'images/email.jpg',
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 25),
                              ),
                              buildTextField(
                                controller: passwordController,
                                hintText: 'Password',
                                imageAsset: 'images/password.jpg',
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                obscureText: true,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(9, 111, 0, 0),
                                width: double.infinity,
                                child: buildElevatedButton(
                                  onPressed: () async {
                                    await signUp();
                                  },
                                  label: 'Sign Up',
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
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String imageAsset,
    required EdgeInsets margin,
    bool obscureText = false,
  }) {
    return Container(
      margin: margin,
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      width: double.infinity,
      
      decoration: BoxDecoration(
        border: Border.all(color:Color(0xffffffff)),
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(30),
        
      ),
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 8, 0),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
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
              imageAsset,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildElevatedButton({
    required VoidCallback onPressed,
    required String label,
  }) {
    return Container(
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
                width: 330,
                height: 46,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff008fa0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 249, 245, 245),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> signUp() async {
    try {
      setState(() {
        isLoading = true;
      });

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'First name': firstnameController.text,
        'Last name': lastnameController.text,
        'Email': emailController.text,
        'password': passwordController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('successful! now you can login'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed. $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
