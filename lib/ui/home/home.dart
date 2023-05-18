import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_item_model.dart';

import '../../data/network/api_repo.dart';
import '../../main.dart';
import 'component/todo_item_cell.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> items = [
    TodoItem(text: "Todo item 1"),
    TodoItem(text: "Todo item 2 "),
    TodoItem(text: "Todo item 3"),
  ];

  void floatingButtonTapped() {
    // 1.TODO add navigation here to new page;

    // 2. TODO after creating new page on add todo item, invoke directly
    // final String itemAdded =  await Repository().addItem("item");

    //3. TODO after invoking this line in new page google how to pop navigation with result and append to local array

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        // title: Text(widget.title),
      ),
      body:

          /* SingleChildScrollView(
        child: Column(
            children: items
                .map((e) => Text(
                      e,
                      style: TextStyle(fontSize: 20),
                    ))
                .toList()),
      ),*/

          ListView.builder(
        itemBuilder: (_, itemIndex) {
          return TodoItemCell(
              item: items[itemIndex],
              onUpdate: (bool isSelected) {
                items[itemIndex].isSelected = isSelected;
              });
        },
        itemCount: items.length,
      ),

      // ListView(
      //     children: items
      //         .map((e) => Text(
      //               e,
      //               style: TextStyle(fontSize: 20),
      //             ))
      //         .toList()),

      floatingActionButton: FloatingActionButton(
        onPressed: floatingButtonTapped,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
