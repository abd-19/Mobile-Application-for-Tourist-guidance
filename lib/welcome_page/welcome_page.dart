// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/sign/LoginPage.dart';
import 'package:flutter/material.dart';

class welcome_page extends StatelessWidget {
  const welcome_page({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff1e1e1e)),
          color: Color(0xffffffff),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/photo_2024-01-10_15-06-26.jpg'),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 412,
              child: Align(
                child: SizedBox(
                  width: 410,
                  height: 412,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      gradient: LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0xffd9d9d9), Color(0x00d9d9d9)],
                        stops: <double>[0, 1],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 45,
              top: 454,
              child: Align(
                child: SizedBox(
                  width: 259,
                  height: 47,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        height: 1.293,
                        color: Color(0xff3c3c3c),
                      ),
                      children: [
                        TextSpan(
                          text: 'Welcome!',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            height: 1.2925,
                            color: Color(0xff3c3c3c),
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            height: 1.2925,
                            color: Color(0xff3c3c3c),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 41,
              top: 710,
              child: Align(
                child: SizedBox(
                  width: 317,
                  height: 76,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Color(0xffa7abad),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 41,
              top: 705,
              child: Align(
                child: SizedBox(
                  width: 317,
                  height: 76,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    
                    child: Text(
                      'Let\'s go',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        height: 1.2925,
                        color: Color.fromRGBO(60, 60, 60, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 41,
              top: 537,
              child: Align(
                child: SizedBox(
                  width: 312,
                  height: 125,
                  child: Text(
                    'get ready for an unforgettable travel experience and discover magical places waiting \nfor you!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.2925,
                      color: Color(0xff3c3c3c),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
