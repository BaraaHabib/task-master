import 'package:auto_route/auto_route.dart';
import 'package:task_master/app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')

/// Holds all the routes that are defined in the app
/// Used to generate the Router object
final class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes =>
      [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: TasksRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: AddTaskRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
        ),
      ];
}
