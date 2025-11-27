import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:walkoftoday/Permission/permission.dart';
import 'package:walkoftoday/permissionGate.dart';
import 'package:walkoftoday/routerPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await Future.delayed(const Duration(seconds: 1));

    bool permissionGrant = await PermissionService().init();

    if(!mounted) return;

    if(permissionGrant){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RouterPage(),));
    }
    else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PermissionGate(),));
    }

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

    bool geoState = await Geolocator.isLocationServiceEnabled();

    if(!geoState){
      return Future.error("error");
    }
  }
}
