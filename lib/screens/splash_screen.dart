import 'dart:async';

import 'package:codefury/screens/get_started_screen.dart';
import 'package:codefury/screens/investor/home_screen.dart';
import 'package:codefury/screens/startup/dashboard.dart';
import 'package:codefury/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token != null) {
      var type = sharedPreferences.getString('type');
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                type == "STARTUP" ? StartupDashboard() : InvestorHome(),
          ),
          (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => GetStarted(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(milliseconds: 500), () {
      navigation();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/images/topright.png"),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: width,
                child: Image.asset(
                  "assets/images/show.png",
                  fit: BoxFit.cover,
                ),
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
            SizedBox(
              height: height,
              width: width,
              child: Image.asset(
                'assets/images/Rectangle.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.08, left: 10, bottom: 30),
                      child: GradientText(
                        "Lorem Ipsum",
                        style: TextStyle(
                          fontSize: 54,
                          // fontFamily: "Outfit",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                        ),
                        gradient: LinearGradient(colors: [
                          Color(0xffEE9B27),
                          Color(0xffE14D28),
                          Color(0xff6F84B8)
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: width * 0.8,
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                          style: TextStyle(
                            color: Color(0xff5b5260),
                            fontSize: 14,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
