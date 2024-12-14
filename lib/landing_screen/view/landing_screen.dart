import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/groups/groups_bloc.dart';
import 'package:study_circle/class/blocs/scan/scan_bloc.dart';
import 'package:study_circle/class/blocs/selected/selected_bloc.dart';
import 'package:study_circle/class/class.dart';
import 'package:study_circle/class/services/group_service.dart';
import 'package:study_circle/home/home.dart';
import 'package:study_circle/landing_screen/bloc/landing_screen_bloc.dart';
import 'package:study_circle/profile/bloc/image_picker/image_picker_bloc.dart';
import 'package:study_circle/profile/bloc/update_user/update_user_bloc.dart';
import 'package:study_circle/profile/profile.dart';
import 'package:study_circle/profile/services/image_service.dart';
import 'package:study_circle/profile/services/user_service.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.class_),
    label: 'Class',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
];

List<Widget> bottomNavScreen(BuildContext context) {
  return <Widget>[
    HomePage(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedBloc(),
        ),
        BlocProvider(
          create: (context) => ScanBloc(),
        ),
        BlocProvider(
          create: (context) => GroupsBloc(GroupService()),
        )
      ],
      child: ClassesPage(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ImagePickerBloc(databaseHelper: ImageService())),
        BlocProvider(
            create: (context) => UpdateUserBloc(userService: UserService()))
      ],
      child: ProfilePage(),
    ),
  ];
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LandingScreen());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingScreenBloc, LandingScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body:
              Center(child: bottomNavScreen(context).elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<LandingScreenBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
