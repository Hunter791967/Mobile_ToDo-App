

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final onEditItem;

  ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.onEditItem,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool isInEditMode = false;

  final _todoEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          widget.onToDoChanged(widget.todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: tdWhite,
        leading: Icon(
          widget.todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdLivingCoral,
          size: 25,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 2),
          child: (!isInEditMode)
              ? Text(
                  widget.todo.todoText!,
                  style: TextStyle(
                    decoration:
                        widget.todo.isDone ? TextDecoration.lineThrough : null,
                    color: widget.todo.isDone ? tdUltraViolet : tdBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : TextField(

                  controller: _todoEditController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            (!isInEditMode)?
            IconButton(
              icon: const Icon(
                Icons.edit_calendar,
                size: 25,
              ),
              onPressed: () {
                setState(() {
                  isInEditMode = true;
                  _todoEditController.text = widget.todo.todoText!;
                });

              },
              color: tdLivingCoral,
            ):
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.cancel,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      isInEditMode = false;

                    });

                  },
                  color: tdLivingCoral,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.save,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      isInEditMode = false;
                      widget.onEditItem(widget.todo.id,_todoEditController.text);
                    });

                  },
                  color: tdLivingCoral,
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                size: 25,
              ),
              onPressed: () {
                widget.onDeleteItem(widget.todo.id);
              },
              color: tdLivingCoral,
            ),
          ],
        ),
      ),
    );
  }
}
