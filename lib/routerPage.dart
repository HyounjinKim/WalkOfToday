import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottomnavi.dart';
import 'mainScreen.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {

  int current_index = 0;
  int cnt = 0;

  void onChange(int index){
    setState(() {
      cnt = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MainScreen(cnt: cnt,onChange: onChange,),
        bottomNavigationBar: BottomNavi(current_index: current_index,onChange: onChange,),
      ),
    );
  }
}
