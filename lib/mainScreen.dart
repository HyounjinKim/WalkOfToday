import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:walkoftoday/naviSave.dart';

class MainScreen extends StatefulWidget {
  final int cnt;
  final Function onChange;

  const MainScreen({super.key,required this.cnt,required this.onChange});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    int cnt = widget.cnt;

    if(cnt == 1){
      print("저장");
      return NaviSave();
    }
    else if(cnt == 2){
      print("설정");
      return Container();
    }else if(cnt == 99){
      return Container();
    }
    else {
      return Stack(
        children: [
          // Container(),
          NaverMap(
            onMapReady: (controller) {
              NLatLng latlng = new NLatLng(37.5670135, 126.9783740);
              print("asdasdsad$latlng");
            },
          ),
          Align(
              alignment: FractionalOffset(0.5, 0.75),
              child:TextButton(onPressed: () => {print("경로 생성 중")},
                style: TextButton.styleFrom(
                    fixedSize: Size(width * 0.3, height * 0.05),
                    backgroundColor: Color(0xFF2E7D32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ), child: Text("산책하기",style: TextStyle(color: Colors.white)),
              )),
          Align(
              alignment: FractionalOffset(0.5, 0.82),
              child:TextButton(onPressed: () => {print("경로 생성 중")},
                style: TextButton.styleFrom(
                    fixedSize: Size(width * 0.3, height * 0.05),
                    backgroundColor: Color(0xFF2E7D32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ), child: Text("산책하기",style: TextStyle(color: Colors.white)),
              )),
        ],
      );
    }
  }
}
