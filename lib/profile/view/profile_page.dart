import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/app/app.dart';
import 'package:study_circle/home/home.dart';
import 'package:study_circle/profile/bloc/image_picker/image_picker_bloc.dart';
import 'package:study_circle/profile/bloc/update_user/update_user_bloc.dart';
import 'package:study_circle/profile/services/image_service.dart';
import 'package:study_circle/profile/services/user_service.dart';
import 'package:study_circle/profile/view/profile_details.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: ProfilePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      backgroundColor: Color(0xFF127369),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Avatar(photo: user.id),
                    const SizedBox(height: 8),
                    Text(
                      user.email ?? '',
                      style:
                          textTheme.titleLarge?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(user.name ?? '',
                        style: textTheme.headlineSmall
                            ?.copyWith(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return BlocProvider(
                          create: (context) =>
                              ImagePickerBloc(databaseHelper: ImageService()),
                          child: BlocProvider(
                            create: (context) =>
                                UpdateUserBloc(userService: UserService()),
                            child: const ProfileDetails(),
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 0.5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.library_books,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Fill Details",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        ],
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              LogoutButton(),
            ],
          );
        },
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AppBloc>().add(const AppLogoutPressed());
      },
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.white, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
