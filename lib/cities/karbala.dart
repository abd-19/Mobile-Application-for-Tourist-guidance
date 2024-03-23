// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';

class karbalaDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = 1.0;
    double ffem = 1.0;
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.fromLTRB(12 * fem, 20 * fem, 0 * fem, 0 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 7 * fem),
            width: 378 * fem,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(6 * fem, 0 * fem, 11 * fem, 16 * fem),
                  width: double.infinity,
                  height: 406 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 49 * fem,
                            height: 25 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: Color(0x66ffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9 * fem,
                        top: 18 * fem,
                        child: Container(
                          width: 352 * fem,
                          height: 388 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 118 * fem, 9 * fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Karbala',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'PT Sans',
                                        fontSize: 24 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2925 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    7 * fem, 0 * fem, 0 * fem, 0 * fem),
                                width: 345 * fem,
                                height: 347 * fem,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(23 * fem),
                                  child: Image.asset(
                                    'images/dicover/karbala/karbalamap.PNG',
                                    fit: BoxFit.cover,
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
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 375 * fem,
            child: Stack(
              children: [
                Positioned(
                  left: 11 * fem,
                  top: 31 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 367 * fem,
                      height: 344 * fem,
                      child: Text(
                        'Karbala is a city in central Iraq, located about 100 kilometers southwest of Baghdad.Karbala holds great religious and historical significance for Muslims, particularly Shia Muslims. It is the site of the Battle of Karbala in 680 AD, where Imam Hussein, the grandson of Prophet Muhammad, was martyred. The city is a major pilgrimage destination for Shia Muslims, who visit the holy shrines of Imam Hussein and his half-brother Abbas.Karbala has a rich cultural heritage, influenced by its historical and religious significance. offering a range of academic programs and research opportunities. These institutions contribute to the city\'s intellectual and educational landscape.The economy of Karbala is primarily driven by religious tourism and agriculture. The influx of pilgrims contributes to the local economy through various services, including accommodations, restaurants, and retail businesses.\n\n                                Population:1000200\n\n',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'PT Sans',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2925 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 0 * fem, 0 * fem),
            width: 1555 * fem,
            //here
            height: 1200 * fem,
            child: Stack(
              children: [
                Positioned(
                  left: 57 * fem,
                  top: 0 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 333 * fem,
                      height: 32 * fem,
                      child: Text(
                        'Touristical Monuments',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'PT Sans',
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2925 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0 * fem,
                  top: 44.3434448242 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 350 * fem,
                      height: 244.47 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28 * fem),
                        child: Image.asset(
                          'images/dicover/karbala/الامام الحسين.PNG',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 4 * fem,
                  top: 297.302734375 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 822 * fem,
                      height: 300 * fem,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 24 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2925 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                          children: [
                            TextSpan(
                              text: 'Holy Shrine Of Imam Hossain \n',
                            ),
                            TextSpan(
                              text:
                                  'The shrine of Imam Hussein is the main pilgrimage and\n visitation site in Karbala. It draws millions of Shia\n visitors each year to commemorate the martyrdom of\n Imam Hussein and his companions the Battle of Karbala\n',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 0,
                                color: Color(0xff585858),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0 * fem,
                  top: 420 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 350 * fem,
                      height: 240.28 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20 * fem),
                        child: Image.asset(
                          'images/dicover/karbala/العباس.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8 * fem,
                  top: 670 * fem,
                  child: Align(
                    child: SizedBox(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 24 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 0,
                            color: Color(0xff000000),
                          ),
                          children: [
                            TextSpan(
                              text: 'Holy Shrine Of Abu Fadhl Al-Abbas\n',
                            ),
                            TextSpan(
                              text:
                                  'Located near the shrine of Imam Hussein,\n the Abbas Ibn Ali Shrine is another sacred site visited\n by a large number of pilgrims. Abbas Ibn Ali holds\n great historical importance in Islamic history,\n and his shrine is revered by visitors.',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 0,
                                color: Color(0xff585858),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 9 * fem,
                  top: 820 * fem,
                  child: Container(
                    width: 341 * fem,
                    height: 118.92 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 10 * fem, 0 * fem),
                          width: 166 * fem,
                          height: 118.92 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20 * fem),
                            child: Image.asset(
                              'images/dicover/karbala/IMG_8367.PNG',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 165 * fem,
                          height: 118.92 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20 * fem),
                            child: Image.asset(
                              'images/dicover/karbala/IMG_8368.PNG',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 86 * fem,
                  top: 950 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 197 * fem,
                      height: 130.29 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20 * fem),
                        child: Image.asset(
                          'images/dicover/karbala/IMG_8369.PNG',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 13 * fem,
                  top: 1082 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 1354 * fem,
                      height: 100 * fem,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 0,
                            color: Color(0xff000000),
                          ),
                          children: [
                            TextSpan(
                              text: 'Alkafeel museum\n',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 0,
                                color: Color(0xff000000),
                              ),
                            ),
                            TextSpan(
                              text:
                                  'The museum contains hundreds of valuables and\n rare pieces gifted by princes and sultans, especially\n the kings of India, the Turkish sultans, and the\n princes of the Persians and Arab Muslims, in\n addition to ministers, notables, merchants, and Muslims from various Islamic countries. \n',
                              style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 0,
                                color: Color(0xff585858),
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
        ],
      ),
    ));
  }
}
