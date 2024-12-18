import 'package:flutter/material.dart';

class NoQuizzesAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        right: 15,
      ),
      child: Container(
        width: 320,
        height: 120,
        decoration: BoxDecoration(
            color: Color(0xFFBFBFBF),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(1, 3),
              ),
            ]),
        child: Center(
          child: Text(
            "No Quiz Available",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
