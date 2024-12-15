import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/bloc/app_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/blocs/scan/scan_bloc.dart';
import 'package:study_circle/class/models/group.dart';

class JoinClassDialog extends StatefulWidget {
  @override
  State<JoinClassDialog> createState() => _JoinClassDialogState();
}

class _JoinClassDialogState extends State<JoinClassDialog> {
  final _classCodeController = TextEditingController();
  late Group currentGroup = Group(invCode: _classCodeController.text);
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _classCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
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
              controller: _classCodeController,
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
                BlocBuilder<ScanBloc, ScanState>(
                  builder: (context, state) {
                    if (state is ScanSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _classCodeController.text = state.barcode;
                      });
                    } else if (state is ScanError) {
                      return Text(
                        'Error: ${state.message}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
            SizedBox(height: 60),
            BlocListener<GroupsBloc, GroupsState>(
              listener: (context, state) {
                if (state is GroupLoaded) {
                  final Group updatedGroup = state.group!.copyWith(
                    invCode: _classCodeController.text,
                    newMemberId: user.id,
                  );

                  BlocProvider.of<GroupsBloc>(context)
                      .add(JoinedGroup(updatedGroup));
                  Navigator.of(context).pop();
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text('Join'),
                    onPressed: () {
                      print('Current Group InvCode: ${currentGroup.invCode}');
                      BlocProvider.of<GroupsBloc>(context)
                          .add(GetGroupByInvCode(currentGroup));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
