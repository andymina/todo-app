import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  // class level props
  final String task;
  final bool done;
  Function(bool?)? onChanged;
  Function(BuildContext)? onEdit;
  Function(BuildContext)? onDelete;

  ToDoTile(
      {super.key,
      required this.task,
      required this.done,
      required this.onChanged,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 25.0, right: 25.0, bottom: 5.0),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onEdit,
              icon: Icons.edit,
              backgroundColor: Colors.yellow,
              borderRadius: BorderRadius.circular(5),
            )
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(5),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.lightGreen, borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Checkbox(
                value: done,
                onChanged: onChanged,
              ),
              Text(
                task,
                style: TextStyle(
                    fontSize: 18,
                    decoration: done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
