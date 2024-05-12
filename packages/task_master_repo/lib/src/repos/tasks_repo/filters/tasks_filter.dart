

import 'package:task_master_repo/src/abstractions/base_filter.dart';

/// {@template tasks_filter}
/// Contains properties to filter tasks by
/// {@endtemplate}
class TasksFilter extends IApiFilter {

  /// {@macro tasks_filter}
  TasksFilter({required super.currentPage, super.pageLength = 10,});


  @override
  List<Object?> get props =>
      [currentPage, pageLength];

  /// items to skip according to [currentPage] and [pageLength]
  int get skippedItemsLength => (currentPage - 1) * pageLength;

}
