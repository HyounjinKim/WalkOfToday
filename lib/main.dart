import 'package:flutter/material.dart';
import 'package:walkoftoday/bottomnavi.dart';
import 'package:walkoftoday/mainScreen.dart';
import 'package:walkoftoday/splashPage.dart';

import 'naviSave.dart';

void main() async {
  runApp(WalkOfToday());
}

class WalkOfToday extends StatefulWidget {
  const WalkOfToday({super.key});

  @override
  State<WalkOfToday> createState() => _WalkOfTodayState();
}

class _WalkOfTodayState extends State<WalkOfToday> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashPage(),
    );
  }
}