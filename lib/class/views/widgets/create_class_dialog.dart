import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/models/group.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

// ignore: must_be_immutable
class CreateClassDialog extends StatefulWidget {
  @override
  State<CreateClassDialog> createState() => _CreateClassDialogState();
}

class _CreateClassDialogState extends State<CreateClassDialog> {
  int randomCode = 0;
  DateTime? selectedDate;

  int _generateRandomCode() {
    final random = Random();
    return 100000 + random.nextInt(900000);
  }

  @override
  void initState() {
    super.initState();
    randomCode = _generateRandomCode();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _classNameController = TextEditingController();
    final TextEditingController _classDescriptionController =
        TextEditingController();
    final TextEditingController _selectedDateController =
        TextEditingController();
    return AlertDialog(
      title: const Text('Create Class'),
      content: Container(
        width: 400,
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: _classNameController,
              decoration: const InputDecoration(hintText: 'Class title'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _classDescriptionController,
              decoration: const InputDecoration(hintText: 'Class Description'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onTap: () => ShowDateCalenddar(context).then((onValue) {
                _selectedDateController.text =
                    onValue.toLocal().toString().split(' ')[0];
              }),
              maxLines: 1,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: () {
            print("Class Name: ${_classNameController.text}");
            print("Class Desc: ${_classDescriptionController.text}");
            print("Meet Up Date: ${_selectedDateController.text}");
            final group = Group(
                name: _classNameController.text,
                invCode: randomCode.toString(),
                description: _classDescriptionController.text,
                date: [_selectedDateController.text]);
            BlocProvider.of<GroupsBloc>(context).add(AddGroups(group));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
