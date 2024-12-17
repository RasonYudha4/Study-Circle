import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/models/group.dart';
import 'package:study_circle/class/views/pages/conducted_class_page.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class ConductedClassCard extends StatefulWidget {
  const ConductedClassCard({
    super.key,
    required this.classDescription,
    required this.classTitle,
    required this.code,
    this.id,
  });
  final String classDescription;
  final String classTitle;
  final String code;
  final String? id;

  @override
  State<ConductedClassCard> createState() => _ConductedClassCardState();
}

class _ConductedClassCardState extends State<ConductedClassCard> {
  final TextEditingController _selectedDateController = TextEditingController();
  late final Group currentGroup;

  void initState() {
    super.initState();
    currentGroup = Group(
      invCode: widget.code,
      name: widget.classTitle,
      date: [_selectedDateController.text],
      description: widget.classDescription,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return const ConductedClassPage();
            },
          ),
        );
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
                  '${widget.classTitle}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert),
                  onSelected: (String value) {
                    if (value == 'delete') {
                      BlocProvider.of<GroupsBloc>(context)
                          .add(DeleteGroup(widget.id!));
                    } else if (value == 'option2') {
                      ShowDateCalenddar(context).then((onValue) {
                        _selectedDateController.text =
                            onValue.toLocal().toString().split(' ')[0];
                        final Group updateGroup =
                            currentGroup.copyWith(date: [onValue.toString()]);
                        BlocProvider.of<GroupsBloc>(context)
                            .add(UpdateGroup(updateGroup));
                      });
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Text('Delete Class'),
                      ),
                      PopupMenuItem<String>(
                        value: 'add',
                        child: Text('Add Meeting'),
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
            child: Text(
              '${widget.classDescription}',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
