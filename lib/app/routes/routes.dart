import 'package:flutter/widgets.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/class/class.dart';
import 'package:study_circle/home/home.dart';
import 'package:study_circle/login/login.dart';
import 'package:study_circle/profile/profile.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticatedHome:
      return [HomePage.page()];
    case AppStatus.authenticatedProfile:
      return [ProfilePage.page()];
    case AppStatus.authenticatedClass:
      return [ClassPage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
