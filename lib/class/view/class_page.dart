import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: ClassPage());

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Class Page"));
  }
}
