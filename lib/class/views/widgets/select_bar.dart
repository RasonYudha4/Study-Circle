import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_circle/class/blocs/selected/selected_bloc.dart';

class SelectBar extends StatelessWidget {
  const SelectBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            context.read<SelectedBloc>().add(SelectJoined());
          },
          child: Container(
            height: 40,
            width: 110,
            alignment: Alignment(0, 0),
            child: BlocBuilder<SelectedBloc, SelectedState>(
              builder: (context, state) {
                return Text(
                  "Joined",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        state is Joined ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<SelectedBloc>().add(SelectConducted());
          },
          child: Container(
            height: 40,
            width: 110,
            alignment: Alignment(0, 0),
            child: BlocBuilder<SelectedBloc, SelectedState>(
              builder: (context, state) {
                return Text(
                  "Conducted",
                  style: TextStyle(
                      fontWeight: state is Conducted
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 20),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
