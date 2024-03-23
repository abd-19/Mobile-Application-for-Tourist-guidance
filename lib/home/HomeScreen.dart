// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = 1.0;
    double ffem = 1.0;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(42 * fem, 50 * fem, 39 * fem, 0 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xff008fa0), Color(0xff008fa0)],
            stops: <double>[0, 1],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 48 * fem),
              child: Text(
                'Tour Buddy',
                style: TextStyle(
                  fontFamily: 'PT Sans',
                  fontSize: 63 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2925 * ffem / fem,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/translator");
              },
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 32 * fem),
                width: 304 * fem,
                height: 419 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
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
                              width: 99.11 * fem,
                              height: 286 * fem,
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
                          top: 10 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 304 * fem,
                              height: 300 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20 * fem),
                                child: Image.asset(
                                  'images/_1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8 * fem,
                          top: 334 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 283 * fem,
                              height: 73 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  color: Color(0xff008fa0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 61 * fem,
                          top: 345 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 300 * fem,
                              height: 52 * fem,
                              child: Text(
                                'Translator',
                                style: TextStyle(
                                  fontFamily: 'PT Sans',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2925 * ffem / fem,
                                  color: Color(0xffffffff),
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
                Navigator.pushNamed(context, "/exchange_rate");
              },
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 32 * fem),
                width: 304 * fem,
                height: 419 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
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
                              width: 99.11 * fem,
                              height: 286 * fem,
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
                          top: 10 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 304 * fem,
                              height: 300 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20 * fem),
                                child: Image.asset(
                                  'images/_2.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8 * fem,
                          top: 334 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 283 * fem,
                              height: 73 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  color: Color(0xff008fa0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 345 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 300 * fem,
                              height: 52 * fem,
                              child: Text(
                                'Exchange Rate',
                                style: TextStyle(
                                  fontFamily: 'PT Sans',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2925 * ffem / fem,
                                  color: Color(0xffffffff),
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
                Navigator.pushNamed(context, "/discover");
              },
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 34 * fem),
                width: 305 * fem,
                height: 419 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 191.9094238281 * fem,
                          top: 119 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 99.11 * fem,
                              height: 286 * fem,
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
                          top: 10 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 304 * fem,
                              height: 310 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20 * fem),
                                child: Image.asset(
                                  'images/_3.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8 * fem,
                          top: 334 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 283 * fem,
                              height: 73 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  color: Color(0xff008fa0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 69 * fem,
                          top: 340 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 172 * fem,
                              height: 52 * fem,
                              child: Text(
                                'Discover',
                                style: TextStyle(
                                  fontFamily: 'PT Sans',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2925 * ffem / fem,
                                  color: Color(0xffffffff),
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
                Navigator.pushNamed(context, "/todo_list");
              },
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(1 * fem, 0 * fem, 3 * fem, 32 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20 * fem),
                ),
                child: Container(
                  width: double.infinity,
                  height: 396 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 191.9094238281 * fem,
                        top: 119 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 99.11 * fem,
                            height: 286 * fem,
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
                        left: 20 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 304 * fem,
                            height: 300 * fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20 * fem),
                              child: Image.asset(
                                'images/_4.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20 * fem,
                        top: 314 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 283 * fem,
                            height: 73 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: Color(0xff008fa0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 60,
                        top: 325 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 300 * fem,
                            height: 52 * fem,
                            child: Text(
                              'TO-DO List',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontSize: 40 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2925 * ffem / fem,
                                color: Color(0xffffffff),
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/booking");
              },
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 32 * fem),
                width: 304 * fem,
                height: 419 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
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
                              width: 99.11 * fem,
                              height: 286 * fem,
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
                          top: 10 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 304 * fem,
                              height: 310 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20 * fem),
                                child: Image.asset(
                                  'images/_5.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8 * fem,
                          top: 334 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 283 * fem,
                              height: 73 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  color: Color(0xff008fa0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 80,
                          top: 345 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 300 * fem,
                              height: 52 * fem,
                              child: Text(
                                'booking',
                                style: TextStyle(
                                  fontFamily: 'PT Sans',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2925 * ffem / fem,
                                  color: Color(0xffffffff),
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
                Navigator.pushNamed(context, "/PostPage");
              },
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 32 * fem),
                width: 304 * fem,
                height: 419 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
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
                              width: 99.11 * fem,
                              height: 286 * fem,
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
                          top: 10 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 304 * fem,
                              height: 310 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20 * fem),
                                child: Image.asset(
                                  'images/post-it-with-a-heart-svgrepo-com.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8 * fem,
                          top: 334 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 283 * fem,
                              height: 73 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  color: Color(0xff008fa0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 80,
                          top: 345 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 300 * fem,
                              height: 52 * fem,
                              child: Text(
                                'Posting',
                                style: TextStyle(
                                  fontFamily: 'PT Sans',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2925 * ffem / fem,
                                  color: Color(0xffffffff),
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
          ],
        ),
      ),
    );
  }
}
