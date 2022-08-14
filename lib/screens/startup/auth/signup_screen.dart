import 'package:codefury/screens/startup/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../widgets/gradient_text.dart';

class StartUpSignUpScreen extends StatefulWidget {
  const StartUpSignUpScreen({Key? key}) : super(key: key);

  @override
  State<StartUpSignUpScreen> createState() => _StartUpSignUpScreenState();
}

class _StartUpSignUpScreenState extends State<StartUpSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
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
              padding: const EdgeInsets.only(left: 10.0, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: width * 0.1,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                  ),
                  GradientText(
                    "Glad to see you,",
                    style: TextStyle(
                      fontSize: width * 0.1,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                    gradient: LinearGradient(colors: [
                      Color(0xffEE9B27),
                      Color(0xffE14D28),
                      Color(0xff6F84B8)
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xff5b5260),
                        fontSize: 18,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 60,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffDADADA),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                              color: Color(0xff8390a1),
                              fontSize: 15,
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 60,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffDADADA),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color(0xff8390a1),
                              fontSize: 15,
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 60,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffDADADA),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xff6A707C),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xff8390a1),
                              fontSize: 15,
                              fontFamily: "Urbanist",
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width * 0.85,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff1e232c),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: MaterialButton(
                            color: Color(0xff1E232C),
                            onPressed: () {},
                            child: Center(
                                child: Text(
                              "Agree and Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 0.15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          StartupLoginScreen(),
                                    ),
                                    (route) => false);
                              },
                              child: Text(
                                " Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 0.15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
