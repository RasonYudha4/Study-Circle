import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/blocs/quiz/quiz_bloc.dart';
import 'package:study_circle/class/services/group_service.dart';
import 'package:study_circle/class/services/quiz_service.dart';
import 'package:study_circle/class/views/pages/pages.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class ConductedClassPage extends StatelessWidget {
  final String id;
  const ConductedClassPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<GroupsBloc>().add(GetGroupById(id));
    return BlocBuilder<GroupsBloc, GroupsState>(
      builder: (context, state) {
        return Scaffold(
          body: BlocBuilder<GroupsBloc, GroupsState>(builder: (context, state) {
            if (state is GroupsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GroupLoaded) {
              final group = state.group;
              return Stack(
                children: [
                  Container(
                    color: Color(0xFF8AA6A3),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 250,
                    decoration: BoxDecoration(
                        color: Color(0xFF127369),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.chevron_left_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              Spacer(),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                ),
                                child: Text(
                                  "Class",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Spacer(),
                              Spacer(),
                              Spacer()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 15, bottom: 25, left: 15),
                          child: Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFBFBFBF),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(1, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    group!.name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Center(
                                    child: Text(
                                      group.description!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              MeetUps(
                                dates: group.date ?? [],
                              ),
                              SizedBox(
                                height: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) {
                                          return MultiBlocProvider(
                                            providers: [
                                              BlocProvider(
                                                  create: (context) =>
                                                      QuizBloc(QuizService())),
                                              BlocProvider(
                                                  create: (context) =>
                                                      GroupsBloc(
                                                          GroupService()))
                                            ],
                                            child: CreateQuizForm(
                                                groupId: this.id),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF127369),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 80,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline_rounded,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Create Quiz",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No quizzes available.'));
            }
          }),
        );
      },
    );
  }
}
