import 'package:flutter/material.dart';

import '../../../model/todo_item_model.dart';

class TodoItemCell extends StatefulWidget {
  const TodoItemCell({Key? key, required this.item, required this.onUpdate})
      : super(key: key);

  final TodoItem item;
  final void Function(bool) onUpdate;

  @override
  State<TodoItemCell> createState() => _TodoItemCellState();
}

class _TodoItemCellState extends State<TodoItemCell> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.item.isSelected;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });

          widget.onUpdate(isSelected);
        },
        child: Text(widget.item.text,
            style: TextStyle(
                fontSize: 20, color: isSelected ? Colors.red : Colors.black)));
  }
}
