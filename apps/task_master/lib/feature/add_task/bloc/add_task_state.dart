part of 'add_task_bloc.dart';

enum AddTaskStatusEnum { init, loading, error, success }

class AddTaskState extends Equatable {
  const AddTaskState({required this.status, this.errorMessage, this.task,});

  factory AddTaskState.init(){
    return const AddTaskState(
      status: AddTaskStatusEnum.init,
    );
  }

  final AddTaskStatusEnum status;

  final String? errorMessage;

  final TaskApiModel? task;

  @override
  List<Object> get props =>
      [
        status,
      ];

  AddTaskState copyWith({
    AddTaskStatusEnum? status,
    String? errorMessage,
    TaskApiModel? task,
  }) {
    return AddTaskState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      task: task ?? this.task,
    );
  }
}
