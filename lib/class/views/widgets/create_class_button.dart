import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/services/group_service.dart';

import 'widgets.dart';

class CreateClass extends StatelessWidget {
  const CreateClass({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF10403B),
      onPressed: () {
        // Warning : Only use this line if you want to delete all the groups since there's a bug somewhere
        // BlocProvider.of<GroupsBloc>(context).add(DeleteAllGroups());
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => GroupsBloc(GroupService()),
              child: CreateClassDialog(),
            );
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
