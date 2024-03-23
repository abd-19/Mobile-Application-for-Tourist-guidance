// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ErbilDetailsScreen extends StatelessWidget {
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
                                      'Erbil',
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
                                    'images/dicover/Erbil/mape.png',
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
                        'Erbil, also known as Hawler, is the capital of the Kurdistan Region in Iraq. It is one of the oldest continuously inhabited cities in the world and has a rich history.Erbil has a long history dating back thousands of years and has been continuously inhabited since at least the 23rd century BC. It has served as a significant cultural and economic center throughout its history.Erbil has a diverse cultural heritage influenced by various civilizations that have occupied the region over the centuries. a UNESCO World Heritage site, which  witnessed significant development in recent years, attracting investments and hosting international events.it has a modern infrastructure with well-developed transportation networks, including an international airport. The city has a range of amenities, including shopping centers, hotels, restaurants, and educational institutions.\n\n                                Population:1000500',
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
                          'images/dicover/Erbil/القلعه.jpg',
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
                            height: 0,
                            color: Color(0xff000000),
                          ),
                          children: [                         
                            TextSpan(
                              text: 'Citadel \n',
                            ),
                            TextSpan(
                              text:
                                   'The Citadel is a major tourist landmark in Erbil.\n Its history dates back thousands of years, and it\n provides stunning views of the city and its\n surrounding areas.',
                              style: TextStyle(
                                
                                fontFamily: 'PT Sans',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w700,
                                
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
                          'images/dicover/Erbil/sami2.jpg',
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
                              text: 'Sami Abdulrahman Park\n',
                            ),
                            TextSpan(
                              text:
                                   'This central park in Erbil is a delightful place to relax\n and enjoy the outdoors, featuring trees, green spaces,\n and artificial lakes.',
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
                  top: 770.9714355469 * fem,
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
                              'images/dicover/Erbil/IMG_8360.PNG',
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
                              'images/dicover/Erbil/IMG_8362.PNG',
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
                  top: 894.9313964844 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 197 * fem,
                      height: 130.29 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20 * fem),
                        child: Image.asset(
                          'images/dicover/Erbil/IMG_8363.PNG',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 13 * fem,
                  top: 1062 * fem,
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
                              text: 'Kayseri market\n',
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
                                  '.Qaysari Bazaar is one of the oldest markets in Erbil,\n offering a wonderful place to buy handicrafts,\n traditional carpets, and local culinary experiences.\n',
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
