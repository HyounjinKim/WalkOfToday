import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walkoftoday/naviSave.dart';

class BottomNavi extends StatefulWidget {
  final int current_index;
  final ValueChanged<int> onTabChanged;

  const BottomNavi({super.key,required this.current_index,required this.onTabChanged,});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {

  late int current_index;

  @override
  void initState() {
    super.initState();
    current_index = widget.current_index;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: current_index,
      onTap: (index)  {
        print(current_index);
        setState(() {
          current_index=index;
        });
        widget.onTabChanged(current_index);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "산책"),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: "저장"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "설정"),
      ],
    );
  }
}
