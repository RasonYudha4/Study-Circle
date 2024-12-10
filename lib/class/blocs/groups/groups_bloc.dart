import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_circle/class/models/group.dart';
import 'package:study_circle/class/services/firestore_service.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final FirestoreService _firestoreService;

  GroupsBloc(this._firestoreService) : super(GroupsInitial()) {
    on<LoadGroups>((event, emit) async {
      try {
        emit(GroupsLoading());
        final groups = await _firestoreService.getGroups().first;
        emit(GroupsLoaded(groups));
      } catch (e) {
        emit(GroupsError('Failed to load classes'));
      }
    });

    on<AddGroups>(
      (event, emit) async {
        try {
          emit(GroupsLoading());
          await _firestoreService.addGroup(event.group);
          emit(GroupsOperationSuccess('Class created successfully'));
        } catch (e) {
          emit(GroupsError('Failed to create class'));
        }
      },
    );

    on<UpdateGroup>(
      (event, emit) async {
        try {
          emit(GroupsLoading());
          await _firestoreService.updateGroup(event.group);
          emit(GroupsOperationSuccess('Class updated successfully'));
        } catch (e) {
          emit(GroupsError('Failed to update class'));
        }
      },
    );

    on<DeleteGroup>(
      (event, emit) async {
        try {
          emit(GroupsLoading());
          await _firestoreService.deleteGroup(event.groupId);
          emit(GroupsOperationSuccess('Class deleted successfully'));
        } catch (e) {
          emit(GroupsError('Failed to delete class'));
        }
      },
    );
  }
}
