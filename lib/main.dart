import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

void main() async {
  print("실행");
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterNaverMap().init(
      clientId: 'c0ktzvqqgp',
      onAuthFailed: (ex) {
        switch (ex) {
          case NQuotaExceededException(:final message):
            print("사용량 초과 (message: $message)");
            break;
          case NUnauthorizedClientException() ||
          NClientUnspecifiedException() ||
          NAnotherAuthFailedException():
            print("인증 실패: $ex");
            break;
        }
      });

  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NaverMap(),
      ),
    );
  }
}

