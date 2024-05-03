import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/auth_repo/firebase_auth_repo.dart';
import 'package:task_master_repo/src/repos/auth_repo/iauth_repo.dart';
import 'package:task_master_repo/src/repos/tasks_repo/itasks_repo.dart';
import 'package:task_master_repo/src/repos/tasks_repo/tasks_repo.dart';
import 'package:task_master_repo/src/resources/configuration.dart';
import 'package:task_master_storage/task_master_storage.dart';

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
  final IAuthRepo auth = FirebaseAuthRepo();

  /// access and manipulate tasks
  final ITasksRepo tasks = TasksRepo();

  /// initialize workspace repositories
  static Future<void> initAppRepos([FirebaseOptions? currentPlatform]) async {
    await Firebase.initializeApp(
      options: currentPlatform,
    );
  }
}
