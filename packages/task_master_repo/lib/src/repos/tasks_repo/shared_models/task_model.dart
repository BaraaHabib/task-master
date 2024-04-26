// ignore_for_file: avoid_dynamic_calls, public_member_api_docs

part of 'task_api_model.dart';

/// _id : 123
/// title : "first task"
/// createdAt : "2024-04-19T15:47:09.874Z"
/// lastUpdatedAt : "2024-04-19T15:47:09.874Z"
/// description : ""
/// status : 1

TaskApiModel taskModelFromJson(String str) =>
    TaskApiModel.fromJson(json.decode(str),);

String taskModelToJson(TaskApiModel data) => json.encode(data.toJson());

class TaskApiModel {
  TaskApiModel({
    num? id,
    String? title,
    String? createdAt,
    String? lastUpdatedAt,
    String? description,
    num? status,
  }) {
    _id = id;
    _title = title;
    _createdAt = createdAt;
    _lastUpdatedAt = lastUpdatedAt;
    _description = description;
    _status = status;
  }

  TaskApiModel.fromJson(dynamic json) {
    _id = json['_id'] as num?;
    _title = json['title'] as String?;
    _createdAt = json['createdAt'] as String?;
    _lastUpdatedAt = json['lastUpdatedAt'] as String?;
    _description = json['description'] as String?;
    _status = json['status'] as num?;
  }

  num? _id;
  String? _title;
  String? _createdAt;
  String? _lastUpdatedAt;
  String? _description;
  num? _status;

  TaskApiModel copyWith({
    num? id,
    String? title,
    String? createdAt,
    String? lastUpdatedAt,
    String? description,
    num? status,
  }) =>
      TaskApiModel(
        id: id ?? _id,
        title: title ?? _title,
        createdAt: createdAt ?? _createdAt,
        lastUpdatedAt: lastUpdatedAt ?? _lastUpdatedAt,
        description: description ?? _description,
        status: status ?? _status,
      );

  num? get id => _id;

  String? get title => _title;

  String? get createdAt => _createdAt;

  String? get lastUpdatedAt => _lastUpdatedAt;

  String? get description => _description;

  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['createdAt'] = _createdAt;
    map['lastUpdatedAt'] = _lastUpdatedAt;
    map['description'] = _description;
    map['status'] = _status;
    return map;
  }
}
