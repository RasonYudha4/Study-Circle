import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MeetUp extends StatelessWidget {
  final String date;
  const MeetUp({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);

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
              formattedDate,
              style: TextStyle(
                fontSize: 20,
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
