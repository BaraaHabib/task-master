import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_master/feature/auth/login/login.dart';


void main() {
  group('LogInCubit', () {
    late LogInCubit counterBloc;

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      counterBloc = LogInCubit();
    });

    blocTest<LogInCubit, LoginState>(
      'emits LogInStatusEnum.error when credentials is invalid tapped',
      build: () => counterBloc,
      act: (cubit) async =>cubit.logIn(),
      expect: () => [
        const LoginState(
            status: LogInStatusEnum.loading,
        ),
        const LoginState(
            status: LogInStatusEnum.error,
        ),
      ],
    );

    // blocTest<LogInCubit, LoginState>(
    //   'emits LogInStatusEnum.success when log in is tapped',
    //   build: LogInCubit.new,
    //   act: (cubit) => cubit.logIn(),
    //   expect: () => [true,],
    // );

    // blocTest<CounterCubit, int>(
    //   'emits [-1] when decrement is called',
    //   build: CounterCubit.new,
    //   act: (cubit) => cubit.decrement(),
    //   expect: () => [equals(-1)],
    // );
  });
}
