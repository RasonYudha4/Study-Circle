import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/scan/scan_bloc.dart';

class QRCodeScanner extends StatelessWidget {
  QRCodeScanner();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ScanBloc, ScanState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              BlocProvider.of<ScanBloc>(context).add(StartScanEvent());
            },
            child: Text('START CAMERA SCAN'),
          );
        },
      ),
    );
  }
}
