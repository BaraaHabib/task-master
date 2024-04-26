import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:task_master/feature/auth/login/helpers/field_names.dart';
import 'package:task_master/locator.dart';

part 'login_state.dart';

class LogInCubit extends Cubit<LoginState> {
  LogInCubit() : super(LoginState.init());

  final formState = GlobalKey<FormBuilderState>();

  Future<void> logIn() async {
    if (formState.currentState?.validate() ?? false) {
      emit(
        state.copyWith(
          status: LogInStatusEnum.loading,
        ),
      );
      final values = formState.currentState?.instantValue;
      final userName = values?[LogInFieldNames.userName.name] as String;
      final password = values?[LogInFieldNames.password.name] as String;
      final res = await Locator.repo.auth.logIn(
        userName: userName,
        password: password,
      );

      if (res.success) {
        emit(
          state.copyWith(
            status: LogInStatusEnum.success,
            token: res.data?.token,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: LogInStatusEnum.error,
            errorMessage: res.message,
          ),
        );
      }
    }
  }
}
