import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/blocs/quiz/quiz_bloc.dart';
import 'package:study_circle/class/services/quiz_service.dart';
import 'package:study_circle/class/views/widgets/widgets.dart';

class JoinedClassPage extends StatelessWidget {
  final String groupId;
  const JoinedClassPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    context.read<GroupsBloc>().add(GetGroupById(groupId));
    return Scaffold(
      body: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, state) {
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                            BlocProvider(
                              create: (context) => QuizBloc(QuizService()),
                              child: AvailableQuizes(
                                groupId: groupId,
                              ),
                            ),
                            MeetUps(
                              dates: group.date ?? [],
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
        },
      ),
    );
  }
}
