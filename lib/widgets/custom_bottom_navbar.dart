import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/app.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0; // Initialize the current index to 0 (Home)
  int _getCurrentIndex(AppStatus status) {
    switch (status) {
      case AppStatus.authenticatedHome:
        return 0;
      case AppStatus.authenticatedClass:
        return 1;
      case AppStatus.authenticatedProfile:
        return 2;
      case AppStatus.unauthenticated:
      default:
        return 0; // Default to home or handle unauthenticated state
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/graduation-cap.png',
            width: 24,
            height: 24,
          ),
          label: 'Class',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Profile',
        ),
      ],
      currentIndex: _getCurrentIndex(context.read<AppBloc>().state.status),
      onTap: (index) {
        setState(() {
          currentIndex = index; // Update the current index
        });

        // Dispatch the corresponding event based on the index tapped
        switch (index) {
          case 0:
            context.read<AppBloc>().add(HomeIconPressed());
            break;
          case 1:
            context.read<AppBloc>().add(ClassIconPressed());
            break;
          case 2:
            context.read<AppBloc>().add(ProfileIconPressed());
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
    );
  }
}
