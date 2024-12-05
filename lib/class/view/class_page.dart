import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/home/home.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: ClassPage());

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
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 110,
                    alignment: Alignment(0, 0),
                    child: Text(
                      "Joined",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 110,
                    alignment: Alignment(0, 0),
                    child: Text(
                      "Conducted",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
