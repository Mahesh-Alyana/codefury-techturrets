import 'package:codefury/provider/feed_list_provider.dart';
import 'package:codefury/provider/feed_provider.dart';
import 'package:codefury/provider/investors_list_provider.dart';
import 'package:codefury/provider/profile_list_provider.dart';
import 'package:codefury/provider/profile_provider.dart';
import 'package:codefury/screens/splash_screen.dart';
import 'package:codefury/screens/startup/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/startup/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProfileProvider()),
        ChangeNotifierProvider.value(value: FeedListProvider()),
        ChangeNotifierProvider.value(value: InvestorListProvider()),
        ChangeNotifierProvider.value(value: FeedProvider()),
        ChangeNotifierProvider.value(value: ProfileListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
