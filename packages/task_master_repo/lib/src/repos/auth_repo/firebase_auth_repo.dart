import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/auth_repo/iauth_repo.dart';
import 'package:task_master_repo/src/repos/auth_repo/models/log_in_model.dart';
import 'package:task_master_repo/src/repos/auth_repo/resources/consts.dart';
import 'package:utils/utils.dart';
/// {@template firebase_auth_repo}
/// basic operations to authenticate users from firebase
/// {@endtemplate}
class FirebaseAuthRepo implements IAuthRepo {

  /// {@macro firebase_auth_repo}
  FirebaseAuthRepo();

  ///
  final _db = FirebaseFirestore.instance;

  @override
  Future<ApiResponseModel<LogInModel>> authenticate(
      {required String userName, String? password,}) async {
    try {
      final documentSnapshot = await _db.collection(fbUsersCollection)
          .doc(userName).get();
      if(documentSnapshot.exists) {
        return ApiResponseModel.success(LogInModel(
          token: userName,
        ),
        );
      }

      throw NotFoundException();

    } on Exception catch (e) {
      return ApiResponseModel.error(
        // ignore: avoid_dynamic_calls
        message: e.toString(),);
    }
  }
}
