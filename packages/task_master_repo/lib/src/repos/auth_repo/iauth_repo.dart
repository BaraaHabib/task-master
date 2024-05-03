

import 'package:network_client_package/network_client.dart';
import 'package:task_master_repo/src/repos/auth_repo/models/log_in_model.dart';
import 'package:task_master_repo/src/repos/irepo.dart';

///
// ignore: one_member_abstracts
abstract class IAuthRepo extends IRepo {

  /// log in
  /// authenticate from backend or from firebase
  /// for firebase we authenticate using device info only
  Future<ApiResponseModel<LogInModel>> authenticate({
    required String userName,
    required String? password,
  });
}
