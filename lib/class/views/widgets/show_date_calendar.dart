import 'package:flutter/material.dart';

Future<DateTime> ShowDateCalenddar(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2019, 1),
    lastDate: DateTime(2101),
  );
  if (picked != null) {
    return picked;
  }
  return DateTime.now();
}
