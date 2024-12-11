import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/models/group.dart';
import 'package:study_circle/class/views/pages/class_page.dart';

import '../widgets/widgets.dart';

class JoinedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GroupsBloc _groupBloc = BlocProvider.of<GroupsBloc>(context);
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
              return Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ...groups.map((group) {
                    return Column(
                      children: [
                        JoinedClassCard(
                            id: group.id,
                            creator: group.creator!,
                            classDescription: group.description,
                            classTitle: group.name,
                            code: group.invCode.toString()),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    );
                  })
                ],
              );
            } else if (state is GroupsOperationSuccess) {
              _groupBloc.add(LoadGroups());
              return Column(
                children: [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
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
          // return Column(
          //   children: [
          //     SizedBox(
          //       height: 16,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute<void>(
          //             builder: (BuildContext context) {
          //               return const ClassPage();
          //             },
          //           ),
          //         );
          //       },
          //       child: Container(
          //         width: 400,
          //         height: 180,
          //         decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 210, 207, 207),
          //           borderRadius: BorderRadius.circular(8),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.black.withOpacity(0.5),
          //               spreadRadius: 2,
          //               blurRadius: 3,
          //               offset: Offset(3, 3),
          //             ),
          //           ],
          //         ),
          //         child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.only(
          //                     left: 20, top: 10, right: 20),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'P',
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: 20),
          //                     ),
          //                     Text(
          //                       'P',
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: 16),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 25, top: 5),
          //                 child: Text.rich(
          //                   TextSpan(
          //                     children: <TextSpan>[
          //                       TextSpan(
          //                         text: 'Conducted By : ',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: 16,
          //                         ),
          //                       ),
          //                       TextSpan(
          //                         text: 'P',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.normal,
          //                           fontSize: 16,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(
          //                     left: 25, top: 15, right: 25),
          //                 child: Text(
          //                   'P',
          //                   textAlign: TextAlign.justify,
          //                   style: TextStyle(color: Colors.black),
          //                 ),
          //               ),
          //             ]),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //   ],
          // );
        ),
      ),
    );
  }
}
