import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/scan/scan_bloc.dart';

import 'widgets.dart';

class JoinClass extends StatelessWidget {
  const JoinClass({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => ScanBloc(),
              child: JoinClassDialog(),
            );
          },
        );
      },
      shape: CircleBorder(),
    );
  }
}
