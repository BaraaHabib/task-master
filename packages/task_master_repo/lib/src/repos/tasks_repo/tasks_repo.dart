
import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/tasks_repo/get_all/get_all_params.dart';
import 'package:task_master_repo/src/repos/tasks_repo/itasks_repo.dart';
import 'package:task_master_repo/src/repos/tasks_repo/shared_models/task_api_model.dart';
import 'package:task_master_repo/src/resources/configuration.dart';

/// {@template auth_repo}
/// basic operations to manage tasks
/// {@endtemplate}
class TasksRepo implements ITasksRepo {

  @override
  Future<ApiResponseModel<TasksApiModel>> getAll({
    required int page,
    required int perPage,
  }) {
    return networkClient.performRequest<TasksApiModel>(
      const GetAllTasksParams(),
      parser: TasksApiModel.fromJson,
    );
  }

}
