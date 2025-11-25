import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

        return Stack(
      children: [
        Container(),
        // NaverMap(),
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
