import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/locator.dart';
import 'package:utils/utils.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.loading());

  Future<void> init() async {
    final res = await Locator.repo.auth.authenticate(
      userName: await Utils.deviceId ?? '',
      password: null,
    );
    if (res.success) {
      emit(
        SplashState.authenticated(),
      );
    } else {
      emit(
        SplashState.unauthenticated(res.message ?? '',),
      );
    }
  }
}
