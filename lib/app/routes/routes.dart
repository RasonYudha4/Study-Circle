import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/landing_screen/bloc/landing_screen_bloc.dart';
import 'package:study_circle/landing_screen/view/landing_screen.dart';
import 'package:study_circle/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [
        MaterialPage(
          child: BlocProvider(
            create: (_) => LandingScreenBloc(),
            child: const LandingScreen(),
          ),
        ),
      ];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
