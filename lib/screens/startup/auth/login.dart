import 'dart:convert';

import 'package:codefury/model/profile_model.dart';
import 'package:codefury/screens/startup/auth/signup_screen.dart';
import 'package:codefury/screens/startup/dashboard.dart';
import 'package:codefury/screens/visitor/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api/apiServices.dart';
import '../../../model/login_request_model.dart';
import '../../../model/login_response_model.dart';
import '../../../widgets/gradient_text.dart';
import '../../investor/home_screen.dart';

class StartupLoginScreen extends StatefulWidget {
  const StartupLoginScreen({Key? key}) : super(key: key);

  @override
  State<StartupLoginScreen> createState() => _StartupLoginScreenState();
}

class _StartupLoginScreenState extends State<StartupLoginScreen> {
  Future<LoginResponseModel> login(String email, String password) async {
    String url = "${ApiConfig.host}/auth/jwt/create/";
    LoginRequestModel requestModel =
        LoginRequestModel(email: email, password: password);
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestModel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> output = json.decode(response.body);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", output['access']);
      print(output['access']);
      var profileResponse = await http
          .get(Uri.parse("${ApiConfig.host}/auth/users/me/"), headers: {
        "Authorization": "JWT ${output['access']}",
      });
      Map<String, dynamic> profileData = json.decode(profileResponse.body);
      ProfileModel _profileData = ProfileModel(
        contactNo: profileData["contactNo"],
        email: profileData["email"],
        name: profileData["name"],
        typeOfAccount: profileData["typeOfAccount"],
      );
      sharedPreferences
        ..setString('type', _profileData.typeOfAccount.toString());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => _profileData == "STARTUP"
                  ? StartupDashboard()
                  : _profileData == "INVESTOR"
                      ? InvestorHome()
                      : VisitorsFeed()),
          (route) => false);
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      Navigator.pop(context);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                json.decode(response.body)["detail"],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            );
          });
      throw Exception('Failed to load data!');
    }
  }

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
                    "Glad to see you, \nAgain!",
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
                      "Log in",
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
                  Align(
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
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
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
                          controller: password,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
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
                    padding: const EdgeInsets.only(right: 30, top: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff6a707c),
                          fontSize: 14,
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Align(
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
                          onPressed: () {
                            login(email.text, password.text);
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => StartupDashboard()),
                            //     (route) => false);
                          },
                          child: Center(
                              child: Text(
                            "Login",
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
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
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
                                          StartUpSignUpScreen(),
                                    ),
                                    (route) => false);
                              },
                              child: Text(
                                " Register Now",
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
