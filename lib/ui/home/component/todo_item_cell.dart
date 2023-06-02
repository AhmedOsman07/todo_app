import 'package:flutter/material.dart';

import '../../../model/todo_item_model.dart';

class TodoItemCell extends StatefulWidget {
  const TodoItemCell(
      {Key? key, required this.item, required this.onUpdateCallback})
      : super(key: key);

  final TodoItem item;
  final void Function(bool) onUpdateCallback;

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
    return Container(
      // color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });

            widget.onUpdateCallback(isSelected);
          },
          child: Text(widget.item.text,
              style: TextStyle(
                  fontSize: 20,
                  color: isSelected ? Colors.red : Colors.black))),
    );
  }
}
