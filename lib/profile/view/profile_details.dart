import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_circle/app/bloc/app_bloc.dart';
import 'package:study_circle/home/widgets/avatar.dart';
import 'package:study_circle/profile/bloc/image_picker/image_picker_bloc.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF8AA6A3),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 100,
            decoration: BoxDecoration(
                color: Color(0xFF127369),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.chevron_left_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: Text(
                          "Add details",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 50,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 80),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Stack(children: [
                          Avatar(photo: user.photo),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () async {
                                final image = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (image != null) {
                                  final userId = user.id;
                                  final imageBytes = await image.readAsBytes();
                                  BlocProvider.of<ImagePickerBloc>(context).add(
                                    InsertImagePickerEvent(
                                      image: imageBytes,
                                      userId: userId,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 32,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                        const SizedBox(height: 10),
                        Text(
                          user.email ?? '',
                          style: textTheme.titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Text(user.name ?? '',
                            style: textTheme.headlineSmall
                                ?.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            bottom: 0,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: user.name == '' ? 'user name' : user.name,
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
          Positioned(
            top: 800,
            left: 0,
            right: 0,
            bottom: 50,
            child: ElevatedButton(
              child: const Text('Update data'),
              onPressed: () {
                // BlocProvider.of<GroupsBloc>(context).add(AddGroups(group));
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
