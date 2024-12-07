import 'package:flutter/material.dart';

import 'widgets.dart';

class CreateClass extends StatelessWidget {
  const CreateClass({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF10403B),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CreateClassDialog();
          },
        );
      },
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        size: 36,
        color: Colors.white,
      ),
    );
  }
}
