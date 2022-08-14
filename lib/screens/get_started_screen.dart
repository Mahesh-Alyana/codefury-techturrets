import 'package:codefury/screens/investor/auth/signup_screen.dart';
import 'package:codefury/screens/startup/auth/signup_screen.dart';
import 'package:codefury/screens/visitor/feed_screen.dart';
import 'package:codefury/screens/visitor/investment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/gradient_text.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  List user = [
    ["A Startup", false],
    ['An Investor', false],
    ['A Visitor', false]
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/images/topright.png"),
            ),
            SizedBox(
              height: height,
              width: width,
              child: Image.asset(
                'assets/images/Rectangle.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                // height: height * 0.55,
                width: width,
                child: Image.asset(
                  "assets/images/ellipse.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "You ",
                    style: TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                  ),
                  GradientText(
                    "Are",
                    style: TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                    gradient: LinearGradient(colors: [
                      Color(0xffEE9B27),
                      Color(0xffE14D28),
                      Color(0xff6F84B8)
                    ]),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Positioned(
                top: height * 0.35,
                child: Container(
                  width: width * 0.6,
                  height: 228,
                  child: ListView.builder(
                      itemCount: user.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 60,
                              width: width * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xff1E232C),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: MaterialButton(
                                  color: user[index][1]
                                      ? Color(0xff1E232c)
                                      : Color.fromARGB(255, 255, 255, 255),
                                  onPressed: () {
                                    for (int i = 0; i < user.length; i++) {
                                      setState(() {
                                        user[i][1] = false;
                                      });
                                    }
                                    user[index][1] = true;
                                  },
                                  child: Center(
                                      child: Text(
                                    user[index][0],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: !user[index][1]
                                          ? Color(0xff1E232c)
                                          : Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 15,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ),
                              )),
                        );
                      }),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                        height: 60,
                        width: width * 0.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: MaterialButton(
                            color: Color(0xff1E232C),
                            onPressed: () {
                              if (user[0][1]) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StartUpSignUpScreen()),
                                    (route) => true);
                              } else if (user[1][1]) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InvestorSignUpScreen()),
                                    (route) => true);
                              } else {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VisitorsFeed(),
                                    ),
                                    (route) => true);
                              }
                            },
                            child: Center(
                                child: Text(
                              "Next",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ),
                        )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
