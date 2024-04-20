part of 'tasks_page.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({required this.task, super.key});

  final TaskApiModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(8.r),
      margin:  EdgeInsets.symmetric(vertical: 5.h,),
      decoration: BoxDecoration(
        // color: task.color.toHex(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task.title ?? '',
              style: context
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
