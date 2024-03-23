// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:app/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introScreen extends StatelessWidget {
  const introScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false,
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to Your Journey through Iraq",
            body:
                "Explore the beauty of history and culture on your exciting journey across the stunning landscapes of Iraq",
            image: Center(
                child: Image.asset(
              "images/intro/building-iraq-landmark-svgrepo-com.png",
              height: 400,
              width: 400,
            )),
          ),
          PageViewModel(
            title: "Enjoy a Unique Experience in Iraq",
            body:
                "Discover breathtaking tourist sites, savor delicious cuisine, and immerse yourself in the warm hospitality of Iraq",
            image: Center(
                child: Image.asset(
              "images/intro/al-shaheed-monument-of-iraq-svgrepo-com.png",
              height: 400,
              width: 400,
            )),
          ),
          PageViewModel(
            title: "Your First Steps into Unforgettable Adventure",
            body:
                "Begin your fantastic travel journey today, and enjoy seeing Iraq through the eyes of true travelers",
            image: Center(
                child: Image.asset(
              "images/intro/flag-for-flag-iraq-svgrepo-com.png",
              height: 400,
              width: 400,
            )),
          ),
        ],
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        onSkip: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        showSkipButton: true,
        skip: Text('Skip',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff008fa0))),
        next: const Icon(
          Icons.arrow_forward,
          size: 30,
          color: Colors.black,
        ),
        done: Text('Done',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff008fa0))),
        dotsDecorator: DotsDecorator(
          size: Size(15, 15),
          color: Colors.grey,
          activeSize: Size(40, 15),
          activeColor: Color(0xff008fa0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
