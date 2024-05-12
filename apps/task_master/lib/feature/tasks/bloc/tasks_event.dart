part of 'tasks_bloc.dart';

class GetTasksPageEvent extends Equatable {
  const GetTasksPageEvent({
    this.page = 1,
    this.filter,
  });

  final int page;

  final TasksFilter? filter;

  @override
  List<Object> get props => [];
}
