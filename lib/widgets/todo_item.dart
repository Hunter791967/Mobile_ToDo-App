import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final onEditItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.onEditItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
                   onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: tdWhite,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdLivingCoral,
          size: 25,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 2),
          child: Text(
            todo.todoText!,
                        style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
              color: todo.isDone ? tdUltraViolet : tdBlack,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.edit_calendar,
                size: 25,
              ),
              onPressed: () {

              },
              color: tdLivingCoral,
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                size: 25,
              ),
              onPressed: () {
                onDeleteItem(todo.id);
              },
              color: tdLivingCoral,
            ),
          ],
        ),
      ),
    );
  }
}
