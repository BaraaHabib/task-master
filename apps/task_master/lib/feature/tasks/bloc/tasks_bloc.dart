import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:task_master/locator.dart';
import 'package:task_master_repo/task_manager_repo.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

const pageSize = 2;

class TasksBloc extends Bloc<GetTasksPageEvent, TasksState> {
  TasksBloc() : super(TasksLoading()) {
    on<GetTasksPageEvent>((event, emit) async {
      try {
        _checkForLocalData(event, emit);

        /// get remote data
        final res = await Locator.repo.tasks.getAll(
          filter: event.filter,
        );

        if (res.success) {
          await Locator.storage.setTasks(
            json.encode(res.data?.toJson()),
          );
          emit(
            TasksPageFetched(
              items: res.data!.data,
              page: event.page,
            ),
          );
        }
      } on Exception catch (e) {
        emit(
          GetTasksError(
            message: e.toString(),
          ),
        );
      }
    });
  }

  void _checkForLocalData(GetTasksPageEvent event, Emitter<TasksState> emit) {
    final locallyStoredResponse = Locator.storage.getTasks;
    if (locallyStoredResponse != null) {
      var localTasks = TasksApiModel.fromJson(locallyStoredResponse).data;
      localTasks = localTasks
          .skip(
            event.filter?.skippedItemsLength ?? 0,
          )
          .toList();
      emit(
        TasksPageFetched(
          items: localTasks,
          page: event.page,
          local: true,
        ),
      );
    }
  }

  void getTasks([int page = 0]) {
    add(
      GetTasksPageEvent(
        page: page,
      ),
    );
  }
}
