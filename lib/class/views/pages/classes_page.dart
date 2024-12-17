import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/blocs/selected/selected_bloc.dart';
import 'package:study_circle/class/services/group_service.dart';

import '../widgets/widgets.dart';
import 'pages.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: ClassesPage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: Color(0xFF8AA6A3),
      body: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, state) {
          return Column(
            children: [
              AppBar(
                title: Text(
                  'Classes',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: Color(0xFF127369),
              ),
              SizedBox(
                height: 20,
              ),
              SelectBar(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocProvider(
                  create: (context) {
                    final groupsBloc = GroupsBloc(GroupService());
                    final initialState = context.read<SelectedBloc>().state;
                    if (initialState is Conducted) {
                      groupsBloc.add(GetConductedGroups(user.id));
                    } else {
                      groupsBloc.add(GetJoinedGroups(user.id));
                    }
                    return groupsBloc;
                  },
                  child: BlocListener<SelectedBloc, SelectedState>(
                    listener: (context, state) {
                      final groupsBloc = context.read<GroupsBloc>();
                      if (state is Conducted) {
                        groupsBloc.add(GetConductedGroups(user.id));
                      } else {
                        groupsBloc.add(GetJoinedGroups(user.id));
                      }
                    },
                    child: BlocBuilder<SelectedBloc, SelectedState>(
                      builder: (context, state) {
                        if (state is Conducted) {
                          return ConductedScreen();
                        } else {
                          return JoinedScreen();
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: BlocBuilder<SelectedBloc, SelectedState>(
        builder: (context, state) {
          if (state is Joined) {
            return JoinClass();
          } else if (state is Conducted) {
            return CreateClass();
          } else {
            return Center(child: Text('Select a Widget'));
          }
        },
      ),
    );
  }
}
