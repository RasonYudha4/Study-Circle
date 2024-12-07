import 'package:flutter/material.dart';

class ConductedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Text(
        'This is Widget 2',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
