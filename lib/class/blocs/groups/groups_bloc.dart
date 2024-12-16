import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_circle/class/models/group.dart';
import 'package:study_circle/class/services/group_service.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final GroupService _GroupService;

  GroupsBloc(this._GroupService) : super(GroupsInitial()) {
    on<LoadGroups>((event, emit) async {
      try {
        emit(GroupsLoading());
        final groups = await _GroupService.getGroups().first;
        emit(GroupsLoaded(groups));
      } catch (e) {
        emit(GroupsError('Failed to load classes'));
      }
    });

    on<GetGroupByInvCode>(
      (event, emit) async {
        try {
          emit(GroupsLoading());

          final group =
              await _GroupService.getGroupByInvCode(event.group.invCode);

          if (group != null) {
            await _GroupService.updateGroup(group);

            print('Bloc reached: ${group}');
            emit(GroupLoaded(group));
          } else {
            emit(GroupsError('Group not found'));
          }
        } catch (e) {
          emit(GroupsError('Error fetching group: $e'));
        }
      },
    );

    on<AddGroups>(
      (event, emit) async {
        try {
          emit(GroupsLoading());
          await _GroupService.addGroup(event.group);
          emit(GroupsOperationSuccess('Class created successfully'));
        } catch (e) {
          emit(GroupsError('Failed to create class'));
        }
      },
    );

    on<GetJoinedGroup>(
      (event, emit) async {
        try {
          emit(GroupsLoading());
          final groups = await _GroupService.getJoinedGroups(event.memberId);
          emit(GroupsLoaded(groups));
        } catch (e) {}
      },
    );

    on<JoinedGroup>((event, emit) async {
      try {
        emit(GroupsLoading());
        Group updatedGroup =
            event.group.copyWith(newMemberId: event.group.newMemberId);
        await _GroupService.joinGroup(updatedGroup);
        print(updatedGroup.newMemberId);
        emit(GroupsOperationSuccess('Class join successfully'));
      } catch (e) {
        emit(GroupsError('Failed to join class'));
      }
    });

    on<UpdateGroup>(
      (event, emit) async {
        try {
          emit(GroupsLoading());
          print('Updating group: ${event.group.name}');
          await _GroupService.updateGroup(event.group);
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
          await _GroupService.deleteGroup(event.groupId);
          emit(GroupsOperationSuccess('Class deleted successfully'));
        } catch (e) {
          emit(GroupsError('Failed to delete class'));
        }
      },
    );

    on<DeleteAllGroups>(
      (event, emit) async {
        try {
          emit(GroupsLoading());
          await _GroupService.deleteAllGroups();
          emit(GroupsOperationSuccess('All classes deleted successfully'));
        } catch (e) {
          emit(GroupsError('Failed to delete all classes'));
        }
      },
    );
  }
}
