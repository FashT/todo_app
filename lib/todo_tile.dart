import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onchanged;
  Function(BuildContext) deleteFunction;

  toDoTile(
    this.taskName,
    this.taskCompleted,
    this.onchanged,
    this.deleteFunction,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (ctx) {
                deleteFunction(ctx);
              },
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onchanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellowAccent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
