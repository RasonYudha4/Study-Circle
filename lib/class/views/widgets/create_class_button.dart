import 'package:flutter/material.dart';

import 'widgets.dart';

class CreateClass extends StatelessWidget {
  const CreateClass({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CreateClassDialog();
          },
        );
      },
      shape: CircleBorder(),
    );
  }
}
