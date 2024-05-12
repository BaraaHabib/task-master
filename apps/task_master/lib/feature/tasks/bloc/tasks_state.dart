part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksPageFetched extends TasksState with EquatableMixin {
  const TasksPageFetched({
    this.items,
    this.page = 0,
    this.local = false,
  });

  final List<TaskApiModel>? items;
  final int? page;
  final bool local;

  ///
  TasksPageFetched appendItems({
    List<TaskApiModel>? data,
  }) {
    return TasksPageFetched(
      items: data,
      page: page,
    );
  }

  @override
  List<Object> get props => [];
}

class TasksLoading extends TasksState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class GetTasksError extends TasksState with EquatableMixin {
  GetTasksError({required this.message});

  @override
  List<Object?> get props => [];

  final String message;
}
