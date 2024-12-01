import 'package:flutter/widgets.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/home/home.dart';
import 'package:study_circle/cubit/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
