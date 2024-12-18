import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/models/group.dart';

import '../widgets/widgets.dart';

class JoinedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color(0xFFBFBFBF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: BlocBuilder<GroupsBloc, GroupsState>(
          builder: (context, state) {
            if (state is GroupsLoading) {
              return Column(
                children: [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            } else if (state is GroupsLoaded) {
              final List<Group> groups = state.groups;
              if (groups.isEmpty) {
                return NoGroupsScreen();
              }
              return Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ...groups.map((group) {
                    return Column(
                      children: [
                        JoinedClassCard(
                            id: group.id!,
                            creator: group.creator ?? '',
                            classDescription: group.description!,
                            classTitle: group.name!,
                            code: group.invCode.toString()),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    );
                  })
                ],
              );
            } else if (state is GroupsError) {
              return Column(
                children: [Center(child: Text("Data Unloaded"))],
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  // Place to store the cards
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
