// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = 1.0;
    double ffem = 1.0;

    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text(
            'Discover',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 241, 240, 240),
              fontWeight: FontWeight.bold,
              fontFamily: 'PT Sans',
            ),
          ),
        ),
        backgroundColor: Color(0xff008fa0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body:
        Container(
          child: SingleChildScrollView(
            
            child: Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 0 * fem),
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/baghdad');
                    },
                    child: Container(
                      margin:
                          EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 32 * fem),
                      width: 384 * fem,
                      height: 340 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 191.9094238281 * fem,
                                top: 119 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 120 * fem,
                                    height: 100 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20 * fem),
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 384 * fem,
                                    height: 300 * fem,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20 * fem),
                                      child: Image.asset(
                                        'images/dicover/baghdad.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50 * fem,
                                top: 264 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 283 * fem,
                                    height: 73 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20 * fem),
                                        color: Color.fromARGB(255, 177, 181, 181),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 110 * fem,
                                top: 274 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 300 * fem,
                                    height: 52 * fem,
                                    child: Text(
                                      'Baghdad',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'PT Sans',
                                        fontSize: 40 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2925 * ffem / fem,
                                        color: Color.fromARGB(255, 27, 26, 26),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/erbil');
                    },
                    child: Container(
                      margin:
                          EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 32 * fem),
                      width: 384 * fem,
                      height: 340 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 191.9094238281 * fem,
                                top: 119 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 120 * fem,
                                    height: 100 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20 * fem),
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 384 * fem,
                                    height: 300 * fem,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20 * fem),
                                      child: Image.asset(
                                        'images/dicover/erpilpg.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50 * fem,
                                top: 264 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 283 * fem,
                                    height: 73 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20 * fem),
                                        color: Color.fromARGB(255, 177, 181, 181),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 150 * fem,
                                top: 274 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 300 * fem,
                                    height: 52 * fem,
                                    child: Text(
                                      'Erbil',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'PT Sans',
                                        fontSize: 40 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2925 * ffem / fem,
                                        color: Color.fromARGB(255, 27, 26, 26),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/karbala");
                    },
                    child: Container(
                      margin:
                          EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 32 * fem),
                      width: 384 * fem,
                      height: 340 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 191.9094238281 * fem,
                                top: 119 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 120 * fem,
                                    height: 100 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20 * fem),
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 384 * fem,
                                    height: 300 * fem,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20 * fem),
                                      child: Image.asset(
                                        'images/dicover/karbala.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50 * fem,
                                top: 264 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 283 * fem,
                                    height: 73 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20 * fem),
                                        color: Color.fromARGB(255, 177, 181, 181),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 110 * fem,
                                top: 274 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 300 * fem,
                                    height: 52 * fem,
                                    child: Text(
                                      'Karbala',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'PT Sans',
                                        fontSize: 40 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2925 * ffem / fem,
                                        color: Color.fromARGB(255, 27, 26, 26),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 0 * fem),
                    width: 384 * fem,
                    height: 340 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 191.9094238281 * fem,
                              top: 119 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 120 * fem,
                                  height: 100 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20 * fem),
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 384 * fem,
                                  height: 300 * fem,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20 * fem),
                                    child: Image.asset(
                                      'images/dicover/map.PNG',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
