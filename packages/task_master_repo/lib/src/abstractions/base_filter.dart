

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

/// {@template base_api_filter}
/// base listing filter
/// {@endtemplate}
abstract class IApiFilter with EquatableMixin{

  /// {@macro base_api_filter}
  IApiFilter({
    required this.currentPage,
    required this.pageLength,
    this.startAfter,
  });


  /// starts from 1
  final int currentPage;

  ///
  final int pageLength;


  ///
  final DocumentSnapshot? startAfter;


  @override
  List<Object?> get props => [
    currentPage,
    pageLength,
    startAfter,
  ];

}
