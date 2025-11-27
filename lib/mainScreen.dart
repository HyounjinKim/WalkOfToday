import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:walkoftoday/naviSave.dart';

class MainScreen extends StatefulWidget {
  final int cnt;
  final Function onChange;

  const MainScreen({super.key,required this.cnt,required this.onChange});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // late NLatLng currentPos;
  //
  // getGeoData() async {
  //   Position pos = await Geolocator.getCurrentPosition();
  //   setState(() {
  //     currentPos = NLatLng(pos.latitude, pos.longitude);
  //   });
  //   print("현재위치 = $currentPos");
  // }

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
              final marker = NMarker(
                id: "currentMarker",
                position: NLatLng(35.4975017, 128.765285),
                caption: NOverlayCaption(text: "현재위치")
              );

              NCircleOverlay circle = NCircleOverlay(
                id: "radius_clicle",
                center: NLatLng(35.4975017, 128.765285),
                radius: 500,
                color: Color(0x1fA5D6A7),
                outlineColor: Color(0xff2E7D32),
                outlineWidth: 0.5
              );

              controller.addOverlay(marker);
              controller.addOverlay(circle);
            },
            options: NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(target: NLatLng(35.4975017, 128.765285),zoom: 14),
            ),
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

//   @override
//   void initState() {
//     super.initState();
//     getGeoData();
//   }
}