import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/auth_repo/iauth_repo.dart';
import 'package:task_master_repo/src/repos/auth_repo/models/log_in_model.dart';
import 'package:task_master_repo/src/resources/firebase_consts.dart';
import 'package:task_master_repo/src/resources/firebase_helper_mixin.dart';
/// {@template firebase_auth_repo}
/// basic operations to authenticate users from firebase
/// {@endtemplate}
class FirebaseAuthRepo  with FirebaseHelpers implements IAuthRepo {

  /// {@macro firebase_auth_repo}
  FirebaseAuthRepo();

  @override
  Future<ApiResponseModel<LogInModel>> authenticate({
    required String userName,
    String? password,
  }) async {
    try {
      if (await _checkIfUserExists(userName)) {
        return ApiResponseModel.success(LogInModel(
          token: userName,
        ),
        );
      }

      await _createUser(userName);

      return ApiResponseModel.success(LogInModel(
        token: userName,
      ),
      );
    } on Exception catch (e) {
      return ApiResponseModel.error(
        // ignore: avoid_dynamic_calls
        message: e.toString(),
      );
    }
  }

  Future<bool> _checkIfUserExists(String deviceId) async {
    final documentSnapshot = await doc(userCollectionPath(deviceId,))
        .get();
    return documentSnapshot.exists;
  }

  Future<void> _createUser(String deviceId) async =>
      doc(userCollectionPath(deviceId,),)
          .set({});

}
