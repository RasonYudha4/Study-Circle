import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/class/bloc/selected_bloc.dart';

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
                if (state is Joined) {
                  return Widget1(); // Replace with your actual widget for "Joined"
                } else if (state is Conducted) {
                  return Widget2(); // Replace with your actual widget for "Conducted"
                } else {
                  return Center(child: Text('Select a Widget'));
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Color(0xFF127369),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                  child: Container(
                    width: 200, // Set the width of the dialog
                    height: 400, // Set the height of the dialog
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Use minimum size
                      children: <Widget>[
                        Text(
                          'Create a class',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Class Name',
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Class Description'),
                        ),
                        SizedBox(height: 20),
                        Text('This is a custom-sized alert dialog.'),
                        SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: Text('Create'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        shape: CircleBorder(),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Text(
        'This is Widget 1',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Text(
        'This is Widget 2',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
