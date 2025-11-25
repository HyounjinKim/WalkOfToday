import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:walkoftoday/bottomnavi.dart';
import 'package:walkoftoday/mainScreen.dart';

import 'naviSave.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // await FlutterNaverMap().init(
  //     clientId: 'c0ktzvqqgp',
  //     onAuthFailed: (ex) {
  //       switch (ex) {
  //         case NQuotaExceededException(:final message):
  //           print("사용량 초과 (message: $message)");
  //           break;
  //         case NUnauthorizedClientException() ||
  //         NClientUnspecifiedException() ||
  //         NAnotherAuthFailedException():
  //           print("인증 실패: $ex");
  //           break;
  //       }
  //     });

  runApp(const WalkOfToday());
}

class WalkOfToday extends StatefulWidget {
  const WalkOfToday({super.key});

  @override
  State<WalkOfToday> createState() => _WalkOfTodayState();
}

class _WalkOfTodayState extends State<WalkOfToday> {

  List<Widget> naviScreen = [MainScreen(),NaviSave()];
  int current_index = 0;

  void _onTabChanged(int index){
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: naviScreen[current_index],
        bottomNavigationBar: BottomNavi(current_index: current_index,onTabChanged: _onTabChanged,),
      ),
    );
  }
}