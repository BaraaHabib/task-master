import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/auth_repo/firebase/firebase_auth_repo.dart';
import 'package:task_master_repo/src/repos/auth_repo/iauth_repo.dart';
import 'package:task_master_repo/src/repos/tasks_repo/firebase/firebase_tasks_repo.dart';
import 'package:task_master_repo/src/repos/tasks_repo/itasks_repo.dart';
import 'package:task_master_repo/src/resources/configuration.dart';
import 'package:task_master_storage/task_master_storage.dart';
import 'package:utils/utils.dart';

/// {@template task_manager_repo}
/// Module that holds api repositories and api connection layer
/// {@endtemplate}
class TaskManagerRepo {
  /// {@macro task_manager_repo}
  TaskManagerRepo({
    required String baseUrl,
    bool withLogging = false,
    TaskMasterStorage? taskMasterStorage,
  }) {
    logging = withLogging;
    storage = taskMasterStorage;
    networkClient = NetworkClient(dio: Dio(),baseUrl: baseUrl);
  }

  /// access authentication repo
  late final IAuthRepo auth;

  /// access and manipulate tasks
  late final ITasksRepo tasks;

  /// initialize workspace repositories
  Future<void> initAppRepos([FirebaseOptions? currentPlatform]) async {
    await Firebase.initializeApp(
      options: currentPlatform,
    );
    auth = FirebaseAuthRepo();
    tasks = FirebaseTasksRepo(await Utils.deviceId ?? '',);
  }
}
