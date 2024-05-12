import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:task_master/feature/add_task/helpers/form_helpers.dart';
import 'package:task_master/locator.dart';
import 'package:task_master_repo/task_manager_repo.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskState.init()) {
    on<AddTaskEvent>(addTask);
  }

  final formKey = GlobalKey<FormBuilderState>();

  Future<void> addTask(AddTaskEvent event, Emitter<AddTaskState> emit) async {
    if (formKey.currentState?.validate() ?? false) {
      emit(
        state.copyWith(
          status: AddTaskStatusEnum.loading,
        ),
      );
      final values = formKey.currentState?.instantValue;
      final title = values?[AddTaskField.title.name] as String;
      final description = values?[AddTaskField.description.name] as String;
      final status = values?[AddTaskField.status.name] as TaskStatus;
      final res = await Locator.repo.tasks.addTask(
        title: title,
        description: description,
        status: status,
      );

      if (res.success) {
        emit(
          state.copyWith(
            status: AddTaskStatusEnum.success,
            task: res.data,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AddTaskStatusEnum.error,
            errorMessage: res.message,
          ),
        );
      }
    }
  }
}
