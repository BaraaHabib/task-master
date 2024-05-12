part of 'splash_cubit.dart';

enum SplashStateEnum {
  loading,
  authenticated,
  unauthenticated,
}

class SplashState extends Equatable {
  const SplashState(
    this.status, {
    this.errorMessage,
  });

  factory SplashState.authenticated() => const SplashState(
        SplashStateEnum.authenticated,
      );

  factory SplashState.unauthenticated(String errorMessage) => SplashState(
        SplashStateEnum.unauthenticated,
        errorMessage: errorMessage,
      );

  factory SplashState.loading() => const SplashState(
        SplashStateEnum.loading,
      );

  final String? errorMessage;

  final SplashStateEnum status;

  @override
  List<Object> get props => [
        status,
        DateTime.now(),
      ];
}
