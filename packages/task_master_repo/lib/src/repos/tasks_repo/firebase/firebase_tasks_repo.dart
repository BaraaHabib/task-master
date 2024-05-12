import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/tasks_repo/filters/tasks_filter.dart';
import 'package:task_master_repo/src/repos/tasks_repo/itasks_repo.dart';
import 'package:task_master_repo/src/repos/tasks_repo/shared_models/task_api_model.dart';
import 'package:task_master_repo/src/resources/firebase_consts.dart';
import 'package:task_master_repo/src/resources/firebase_helper_mixin.dart';
/// {@template firebase_tasks_repo}
/// Manipulate tasks from firebase
/// {@endtemplate}
class FirebaseTasksRepo with FirebaseHelpers implements ITasksRepo {
  /// {@macro firebase_tasks_repo}
  FirebaseTasksRepo(this._userId);

  final String _userId;


  @override
  Future<ApiResponseModel<TasksApiModel>> getAll({
    TasksFilter? filter,
  }) async {
    try {
      final querySnapshot = await docs(
        tasksCollectionPath(_userId,),
        filter: filter,
      );

      final res = querySnapshot
          .docs
          .map(TaskApiModel.fromQueryDocumentSnapshot,)
          .toList();

      return ApiResponseModel.success(TasksApiModel(
        data: res,
      ),
      );
    } on Exception catch (e) {
      return ApiResponseModel.error(
        // ignore: avoid_dynamic_calls
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponseModel<TaskApiModel>> addTask(
      {required String title, required String description, required TaskStatus status}) async {

    try {

      var task = TaskApiModel.prepareToCreate(
        status: status,
        description: description,
        title: title,
      ).setTimeStamps();

      final res = await addDocument(
        tasksCollectionPath(_userId),
        task.toJson(),
      );

      task = TaskApiModel.fromQueryDocumentSnapshot(res,);

      return ApiResponseModel.success(task,);
    } on Exception catch (e) {
      return ApiResponseModel.error(
        // ignore: avoid_dynamic_calls
        message: e.toString(),
      );
    }
  }

}
