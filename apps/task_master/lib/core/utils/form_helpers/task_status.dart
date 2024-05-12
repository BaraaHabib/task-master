
import 'package:flutter/material.dart';
import 'package:task_master/app/generated/l10n.dart';
import 'package:task_master_repo/task_manager_repo.dart';

extension TaskStatusHelpers on TaskStatus{

  static List<DropdownMenuItem<TaskStatus>> get asDropdownMenuItem =>
      TaskStatus.values
          .map((e) =>
          DropdownMenuItem<TaskStatus>(
            value: e,
            child: Text(e.translated,),
          ),)
          .toList();

  String get translated =>
      switch(this){
        TaskStatus.finished => AppLocalizations.current.finished,
        TaskStatus.canceled => AppLocalizations.current.canceled,
        TaskStatus.inProgress => AppLocalizations.current.inProgress,
      };

}
