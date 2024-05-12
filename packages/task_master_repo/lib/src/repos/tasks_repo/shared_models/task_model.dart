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

class TaskApiModel with EquatableMixin {
  TaskApiModel({
    num? id,
    String? title,
    Timestamp? createdAt,
    String? lastUpdatedAt,
    String? description,
    TaskStatus? status,
  }) {
    _id = id;
    _title = title;
    _createdAt = createdAt;
    _lastUpdatedAt = lastUpdatedAt;
    _description = description;
    _status = status;
  }

  factory TaskApiModel.prepareToCreate({
    required TaskStatus status,
    required String description,
    required String title,
  }) {
    return TaskApiModel(
      status: status,
      description: description,
      title: title,
    );
  }

  TaskApiModel.fromJson(dynamic json) {
    _id = json['_id'] as num?;
    _title = json['title'] as String?;
    _createdAt = json['createdAt'] as Timestamp?;
    _lastUpdatedAt = json['lastUpdatedAt'] as String?;
    _description = json['description'] as String?;
    _status = TaskStatus.fromInt(json['status'] as int?);
  }

  TaskApiModel.fromQueryDocumentSnapshot(DocumentSnapshot snapshot) {
    final json = snapshot.data()! as Map<String, dynamic>;
    _id = json['_id'] as num?;
    _title = json['title'] as String?;
    _createdAt = json['createdAt'] as Timestamp?;
    _lastUpdatedAt = json['lastUpdatedAt'] as String?;
    _description = json['description'] as String?;
    _status = TaskStatus.fromInt(json['status'] as int?);
  }

  num? _id;
  String? _title;
  Timestamp? _createdAt;
  String? _lastUpdatedAt;
  String? _description;
  TaskStatus? _status;

  TaskApiModel copyWith({
    num? id,
    String? title,
    Timestamp? createdAt,
    String? lastUpdatedAt,
    String? description,
    TaskStatus? status,
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

  DateTime? get createdAt => _createdAt?.toDate().toLocal();

  String? get lastUpdatedAt => _lastUpdatedAt;

  String? get description => _description;

  TaskStatus? get status => _status;

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


  @override
  List<Object?> get props => [_id,];

  TaskApiModel setTimeStamps() {
    _createdAt = Timestamp.now();
    return this;
  }
}

enum TaskStatus{
  finished,
  inProgress,
  canceled;

  factory TaskStatus.fromInt(int? value){
    value ??= 1;
    return TaskStatus.values[value];
  }

}
