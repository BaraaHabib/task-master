import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_master/feature/auth/login/login.dart';
import 'package:task_master/feature/splash/splash.dart';

import '../../helpers/helpers.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LogInCubit {}
class MockSplashCubit extends MockCubit<SplashState> implements SplashCubit {}

void main() {
  group('SplashPage', () async {
    late SplashCubit splashCubit;

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      splashCubit = MockSplashCubit();
    });

    testWidgets('renders SplashPage', (tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await tester.pumpApp(
        BlocProvider.value(
          value: splashCubit,
          child: const SplashPage(),
        ),
      );
      expect(find.byType(SplashPage), findsOneWidget);
    });
  });

  group('LoginPage', () {
    testWidgets('renders LoginPage', (tester) async {
      await tester.pumpApp(const LoginPage());
      expect(find.byType(LoginView), findsOneWidget);
    });
  });

  group('LoginView', () {
    late LogInCubit loginCubit;

    setUp(() {
      loginCubit = MockLoginCubit();
    });

    testWidgets('calls login when login button is tapped',
            (tester) async {
          // when(() => loginCubit.logIn()).thenReturn(LoginState(status: LogInStatusEnum.success,));

          await tester.pumpApp(
            BlocProvider.value(
              value: loginCubit,
              child: const LoginView(),
            ),
          );
          await tester.tap(find.byKey(const ValueKey('login')));
          verify(() => loginCubit.logIn()).called(1);
        });
  });
}
