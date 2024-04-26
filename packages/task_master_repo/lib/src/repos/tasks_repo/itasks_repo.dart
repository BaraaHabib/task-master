

import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/tasks_repo/shared_models/task_api_model.dart';

///
// ignore: one_member_abstracts
abstract class ITasksRepo {

  /// get all tasks
  Future<ApiResponseModel<TasksApiModel>> getAll(
      {required int page, required int perPage,});
}
