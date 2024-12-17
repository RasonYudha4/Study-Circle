import 'package:flutter/material.dart';

class MeetUp extends StatelessWidget {
  const MeetUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Clicked");
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          right: 15,
        ),
        child: Container(
          width: 120,
          height: 150,
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
              "Text Panjang Banget Asli Gila",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
