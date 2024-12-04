import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/home/home.dart';
import 'package:study_circle/landing_screen/bloc/landing_screen_bloc.dart';

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

const List<Widget> bottomNavScreen = <Widget>[
  HomePage(),
  Text('Index 1: Class'),
  Text('Index 2: Profile'),
];

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LandingScreen());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingScreenBloc, LandingScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
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
