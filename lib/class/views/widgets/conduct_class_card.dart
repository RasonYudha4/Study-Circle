import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/models/group.dart';
import 'package:study_circle/class/services/group_service.dart';
import 'package:study_circle/class/views/pages/conducted_class_page.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class ConductedClassCard extends StatefulWidget {
  const ConductedClassCard({
    super.key,
    required this.group,
  });
  final Group group;

  @override
  State<ConductedClassCard> createState() => _ConductedClassCardState();
}

class _ConductedClassCardState extends State<ConductedClassCard> {
  final TextEditingController _selectedDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return BlocProvider(
                create: (context) => GroupsBloc(GroupService()),
                child: ConductedClassPage(id: widget.group.id!),
              );
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
                  '${widget.group.name}',
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
                          .add(DeleteGroup(widget.group.id!));
                    } else if (value == 'add') {
                      ShowDateCalenddar(context).then((onValue) {
                        String formattedDate =
                            onValue.toLocal().toString().split(' ')[0];
                        _selectedDateController.text = formattedDate;

                        List<String> updatedDates =
                            List.from(widget.group.date ?? []);
                        updatedDates.add(formattedDate);

                        final Group updateGroup =
                            widget.group.copyWith(date: updatedDates);

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
              '${widget.group.description}',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
