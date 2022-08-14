import 'package:codefury/screens/startup/feed_screen.dart';
import 'package:codefury/screens/startup/home_screen.dart';
import 'package:codefury/screens/startup/investments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartupDashboard extends StatefulWidget {
  const StartupDashboard({Key? key}) : super(key: key);

  @override
  State<StartupDashboard> createState() => _StartupDashboardState();
}

class _StartupDashboardState extends State<StartupDashboard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? StartUpHome()
          : _currentIndex == 1
              ? Fundings()
              : StartupFeed(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: ((value) {
            setState(() {
              _currentIndex = value;
            });
          }),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/home.svg",
                  color: _currentIndex == 0
                      ? Color(0xff242424)
                      : Color(0xffCCCEDC),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/investments.svg",
                  color: _currentIndex == 1
                      ? Color(0xff242424)
                      : Color(0xffCCCEDC),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/chat.svg",
                  color: _currentIndex == 2
                      ? Color(0xff242424)
                      : Color(0xffCCCEDC),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/feed.svg",
                  color: _currentIndex == 3
                      ? Color(0xff242424)
                      : Color(0xffCCCEDC),
                ),
                label: ""),
          ]),
    );
  }
}
