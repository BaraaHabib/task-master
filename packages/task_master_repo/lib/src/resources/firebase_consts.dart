

import 'package:utils/utils.dart';

/// users collection name
const fbUsersCollection = 'users';


/// get users collection by id
String userCollectionPath(String id) => '$fbUsersCollection/$id';

/// get user tasks collection by his id
String tasksCollectionPath(String id) => '$fbUsersCollection/$id/tasks';

/// get users collection by id
Future<String> taskDocumentPath({
  required String taskId,
}) async => '$fbUsersCollection/${await Utils.deviceId}/tasks/$taskId';


