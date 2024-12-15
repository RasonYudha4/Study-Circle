import 'package:flutter/material.dart';

class NoGroupsScreen extends StatelessWidget {
  const NoGroupsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
          height: 510,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  size: 180,
                  color: Color.fromARGB(82, 0, 0, 0),
                ),
                Text(
                  'No Groups Available', // Optional: Add a message
                  style: TextStyle(
                      color: Color.fromARGB(82, 0, 0, 0),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
