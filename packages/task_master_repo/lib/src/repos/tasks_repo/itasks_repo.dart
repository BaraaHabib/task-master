

import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/irepo.dart';
import 'package:task_master_repo/src/repos/tasks_repo/filters/tasks_filter.dart';
import 'package:task_master_repo/src/repos/tasks_repo/shared_models/task_api_model.dart';

///
// ignore: one_member_abstracts
abstract class ITasksRepo extends IRepo {


  /// get all tasks
  Future<ApiResponseModel<TasksApiModel>> getAll({TasksFilter? filter,});

  /// add new tasks
  Future<ApiResponseModel<TaskApiModel>> addTask(
      {
        required String title,
        required String description,
        required TaskStatus status,
      });


}
