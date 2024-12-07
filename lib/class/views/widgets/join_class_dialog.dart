import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/scan/scan_bloc.dart';

class JoinClassDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 400,
        height: 360,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Join a class',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Class Code',
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ScanBloc>(context).add(StartScanEvent());
                    },
                    child: Text('START CAMERA SCAN'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Scanned Barcode: ',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text('Join'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
