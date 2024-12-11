import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/models/group.dart';

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
    return 100000 +
        random.nextInt(
            900000); // Generates a random number between 100000 and 999999
  }

  @override
  void initState() {
    super.initState();
    randomCode =
        _generateRandomCode(); // Generate the random code on initialization
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
            // GestureDetector(
            //   onTap: () async {
            //     DateTime? pickedDate = await showDatePicker(
            //       context: context,
            //       initialDate: selectedDate ?? DateTime.now(),
            //       firstDate: DateTime(2000),
            //       lastDate: DateTime(2101),
            //     );
            //     if (pickedDate != null && pickedDate != selectedDate) {
            //       selectedDate = pickedDate;
            //       _selectedDateController.text =
            //           "${selectedDate!.toLocal()}".split(' ')[0];
            //       (context as Element).markNeedsBuild();
            //     }
            //   },
            //   child: AbsorbPointer(
            //     child: TextFormField(
            //       decoration: InputDecoration(
            //         prefixIcon: Icon(Icons.calendar_month_outlined),
            //         hintText: selectedDate != null
            //             ? "${selectedDate!.toLocal()}".split(' ')[0]
            //             : 'Meet up date',
            //         contentPadding:
            //             EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            //       ),
            //       controller: _selectedDateController,
            //     ),
            //   ),
            // ),
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
                invCode: randomCode,
                description: _classDescriptionController.text,
                date: _selectedDateController.text);
            BlocProvider.of<GroupsBloc>(context).add(AddGroups(group));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Future<DateTime> ShowDateCalenddar(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019, 1),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      return picked;
    }
    return DateTime.now();
  }

  void printText(String label, String value) {
    print('$label: $value');
  }
}
