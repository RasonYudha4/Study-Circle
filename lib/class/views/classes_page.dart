import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/class/blocs/scan/scan_bloc.dart';
import 'package:study_circle/class/blocs/selected/selected_bloc.dart';

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

class QRCodeScanner extends StatelessWidget {
  QRCodeScanner();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ScanBloc, ScanState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              BlocProvider.of<ScanBloc>(context).add(StartScanEvent());
            },
            child: Text('START CAMERA SCAN'),
          );
        },
      ),
    );
  }
}

class JoinClass extends StatelessWidget {
  const JoinClass({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => ScanBloc(),
              child: JoinClassDialog(),
            );
          },
        );
      },
      shape: CircleBorder(),
    );
  }
}

// ignore: must_be_immutable
class JoinClassDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 400,
        height: 450,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Join a class',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Class Code',
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ScanBloc>(context).add(StartScanEvent());
                    },
                    child: Text('START CAMERA SCAN'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Scanned Barcode: ',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('Join'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CreateClass extends StatelessWidget {
  const CreateClass({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CreateClassDialog();
          },
        );
      },
      shape: CircleBorder(),
    );
  }
}

// ignore: must_be_immutable
class CreateClassDialog extends StatelessWidget {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 400,
        height: 450,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Create a class',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Class Name',
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Class Description',
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null && pickedDate != selectedDate) {
                  selectedDate = pickedDate;
                  (context as Element).markNeedsBuild(); // Force rebuild
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    hintText: selectedDate != null
                        ? "${selectedDate!.toLocal()}".split(' ')[0]
                        : 'Meet up date',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('Create'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JoinedScreen extends StatelessWidget {
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

class ConductedScreen extends StatelessWidget {
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
