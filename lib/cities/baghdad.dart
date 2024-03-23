// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:app/feature/booking.dart';
import 'package:app/wedigte/parallerswiper.dart';
import 'package:flutter/material.dart';

class BaghdadDetailsScreen extends StatelessWidget {
  static const images = <String>[
    'images/restaurnt.jpg',
    'images/hotel.jpg',
    'images/farm.jpg',
    'images/coffee.jpg',
  ];
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
                                      'Baghdad',
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
                                    'images/dicover/baghdad/baghdadmap.png',
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
                        'Baghdad is the capital of Iraq and one of the largest cities in the Arab world, and the second largest city in Western Asia, after Tehran, with a population of 7,216,040 (2020). Located along the Tigris River, the city was founded in the 8th century and became the capital of the Abbasid Caliphate. Within a short time of its inception, Baghdad evolved into a significant cultural, commercial, and intellectual center of the Muslim world. This, in addition to housing several key academic institutions (e.g., House of Wisdom), garnered the city a worldwide reputation as the "Center of Learning". Throughout the High Middle Ages, Baghdad was considered to be the largest city in the world with an estimated population of 1,200,000 people. The city was largely destroyed at the hands of the Mongol Empire in 1258, resulting in a decline that would linger through many centuries due to frequent plagues and multiple successive empires.\n\nPopulation: 70000000\n\n',
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
                          'images/dicover/baghdad/نصب الشهيد.jpg',
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
                              text: 'Martyr Monument \n',
                            ),
                            TextSpan(
                              text:
                                  'Landmark memorial dedicated to Iraqi war soldiers with\n an artificial lake & a split turquoise dome.',
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
                  top: 369 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 350 * fem,
                      height: 240.28 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20 * fem),
                        child: Image.asset(
                          'images/dicover/baghdad/المدرسة المستنصرية.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8 * fem,
                  top: 621.8161621094 * fem,
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
                              text: 'Al-Mustansiriya School\n',
                            ),
                            TextSpan(
                              text:
                                  'was a medieval-era scholarly complex that provided\n a universal system of higher education. It was\n established in 1227 CE and was named after and built\n by the Abbasid Caliph al-Mustansir in Baghdad, Iraq.',
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
                              'images/dicover/baghdad/2022-10-21.jpg',
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
                              'images/dicover/baghdad/2022.jpg',
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
                          'images/dicover/baghdad/2023-06-06.jpg',
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
                              text: 'Liberation Square\n',
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
                                  'Tahrir Square originally known as Queen Alia,\n is a main square and an important landmark in the city.\n It includes the Liberation Column monument,\n the central fountain, and the tunnel.',
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
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'book now in baghdad',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelListScreen()),
                      );
                    },
                    child: ParallaxSwiper(
                      // List of image URLs to display
                      images: images,
                      // Fraction of the viewport for each image
                      viewPortFraction: 0.85,
                      // Disable the background zoom effect
                      backgroundZoomEnabled: false,
                      // Disable the foreground fade effect
                      foregroundFadeEnabled: false,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
