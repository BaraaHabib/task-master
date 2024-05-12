import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_master/app/l10n/l10n.dart';
import 'package:task_master/core/utils/form_helpers/task_status.dart';

import 'package:task_master/feature/add_task/add_task.dart';
import 'package:task_master/feature/add_task/helpers/form_helpers.dart';
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_ui/task_master_ui.dart';

@RoutePage()
class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddTaskBloc(),
      child: const AddTaskView(),
    );
  }
}

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
      builder: (context, state) {
        return FormBuilder(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                context.l10n.addTask,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: AddTaskField.title.name,
                    decoration: InputDecoration(
                      hintText: context.l10n.enterTaskTitle,
                    ),
                  ),
                  vSeparator,
                  FormBuilderTextField(
                    name: AddTaskField.description.name,
                    decoration: InputDecoration(
                      hintText: context.l10n.briefTaskDescription,
                    ),
                    maxLines: 5,
                  ),
                  vSeparator,
                  FormBuilderDropdown<TaskStatus>(
                      name: AddTaskField.description.name,
                      items: TaskStatusHelpers.asDropdownMenuItem,
                      initialValue: TaskStatus.values.first,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PrimaryButton(
                        content: Text(
                          context.l10n.save,
                        ),
                      ),
                      PrimaryButton(
                        content: Text(
                          context.l10n.cancel,
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get vSeparator => 10.verticalSpace;
}
