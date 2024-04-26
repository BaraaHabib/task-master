// ignore_for_file: inference_failure_on_function_invocation, strict_raw_type
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'constants.dart';
part 'app_state/state_utils.dart';
part 'tasks/tasks_utils.dart';

/// {@template task_master_storage}
/// Module to hold and cash data
/// {@endtemplate}
class TaskMasterStorage with AppStateStorageMixin, TasksStorageMixin {
  /// {@macro task_master_storage}
  TaskMasterStorage();

  ///
  static TaskMasterStorage? _instance;

  /// public instance to access storage
  static TaskMasterStorage get instance {
    assert(_instance != null,
    'No instance of TaskMasterStorage was initialized.',);
    return _instance!;
  }

  /// get session data, user info etc ..
  static Box get appState => Hive.box(_stateBox);

  /// get tasks
  static Box get tasks => Hive.box(_tasksBox);

  /// initialize [TaskMasterStorage]
  static Future<TaskMasterStorage> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_stateBox);
    await Hive.openBox(_tasksBox);
    _instance = TaskMasterStorage();
    return _instance!;
  }
}
