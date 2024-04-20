import 'dart:convert';

import 'package:task_master_repo/src/abstractions/base_api_model.dart';

part 'task_model.dart';

///
class TasksApiModel extends ApiSuccessModel {

  ///
  TasksApiModel({
    num page = 1,
    num perPage = 10,
    num total = 0,
    num totalPages = 0,
    List<TaskApiModel> data = const [],
  }) {
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    _data = data;
  }

  TasksApiModel.fromJson(Map<String, dynamic> json) {
    _page = json['page'] as num;
    _perPage = json['per_page'] as num;
    _total = json['total'] as num;
    _totalPages = json['total_pages'] as num;
    if (json['data'] is List) {
      // ignore: inference_failure_on_function_invocation
      final list = json['data'] as List;
      _data = [];
      // ignore: avoid_dynamic_calls
      for(final item in list){
        _data?.add(TaskApiModel.fromJson(item as Map<String, dynamic>));
      }
    }
  }

  late final num? _page;
  late final num? _perPage;
  late final num? _total;
  late final num? _totalPages;
  late final List<TaskApiModel>? _data;

  ///
  TasksApiModel copyWith({
    num? page,
    num? perPage,
    num? total,
    num? totalPages,
    List<TaskApiModel>? data,
  }) =>
      TasksApiModel(page: page ?? _page!,
        perPage: perPage ?? _perPage!,
        total: total ?? _total!,
        totalPages: totalPages ?? _totalPages!,
        data: data ?? _data!,
      );

  ///
  num get page => _page ?? 1;

  ///
  num get perPage => _perPage ?? 10;

  ///
  num get total => _total ?? 0;

  ///
  num get totalPages => _totalPages ?? 0;

  ///
  List<TaskApiModel> get data => _data ?? [];

  ///
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['total'] = _total;
    map['total_pages'] = _totalPages;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList() ?? [];
    }
    return map;
  }

  @override
  ApiSuccessModel fromJson(Map<String, dynamic> json) =>
      TasksApiModel.fromJson(json);

  @override
  List<Object?> get props => [_page, _perPage, _total, _totalPages,];

}
