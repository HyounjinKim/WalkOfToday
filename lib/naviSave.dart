import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkoftoday/main.dart';

class NaviSave extends StatefulWidget {

  const NaviSave({super.key,});

  @override
  State<NaviSave> createState() => _NaviSaveState();
}

class _NaviSaveState extends State<NaviSave> {
  @override
  Widget build(BuildContext context) {
    return Align(
      // alignment: Alignment(0, 0),
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}