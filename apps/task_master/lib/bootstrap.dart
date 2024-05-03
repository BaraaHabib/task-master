import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_master/app/environment/app_environment.dart';
import 'package:task_master/firebase_options.dart';
import 'package:task_master/locator.dart';
import 'package:task_master_repo/task_manager_repo.dart';

Future<void> bootstrap({required FutureOr<Widget> Function() builder, required AppEnvironment environment}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      /// initialize app repositories

      // Initialize Locator and Utils
      await Future.wait([
        TaskManagerRepo.initAppRepos(
            DefaultFirebaseOptions.currentPlatform,
        ),
        Locator.locateServices(environment: environment),
      ]);

      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
