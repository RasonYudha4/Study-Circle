import 'package:flutter/material.dart';

class ConductedClassCard extends StatelessWidget {
  const ConductedClassCard({
    super.key,
    required this.classDescription,
    required this.classTitle,
    required this.code,
  });
  final String classDescription;
  final String classTitle;
  final String code;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Clicked");
      },
      child: Container(
        width: 400,
        height: 140,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 210, 207, 207),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${classTitle}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  '${code}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
            child: Text(
              '${classDescription}',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
