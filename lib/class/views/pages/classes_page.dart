import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/class/blocs/selected/selected_bloc.dart';

import '../widgets/widgets.dart';
import 'pages.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: ClassesPage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      backgroundColor: Color(0xFF8AA6A3),
      body: Column(
        children: [
          AppBar(
            title: Text(
              'Classes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF8AA6A3),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<SelectedBloc>().add(SelectJoined());
                },
                child: Container(
                  height: 40,
                  width: 110,
                  alignment: Alignment(0, 0),
                  child: BlocBuilder<SelectedBloc, SelectedState>(
                    builder: (context, state) {
                      return Text(
                        "Joined",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: state is Joined
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<SelectedBloc>().add(SelectConducted());
                },
                child: Container(
                  height: 40,
                  width: 110,
                  alignment: Alignment(0, 0),
                  child: BlocBuilder<SelectedBloc, SelectedState>(
                    builder: (context, state) {
                      return Text(
                        "Conducted",
                        style: TextStyle(
                            fontWeight: state is Conducted
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 20),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<SelectedBloc, SelectedState>(
              builder: (context, state) {
                if (state is Conducted) {
                  return ConductedScreen();
                } else {
                  return JoinedScreen();
                }
              },
            ),
          )
        ],
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
