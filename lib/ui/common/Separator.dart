import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 28,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Color(0xff00c6ff)),
    );
  }
}