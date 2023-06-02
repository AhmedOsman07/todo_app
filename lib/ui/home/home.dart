import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_item_model.dart';
import 'package:todo_app/ui/add_item/add_item.dart';

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

  final Repository _repository = Repository();

  @override
  void initState() {
    executeFetchingApi();
    super.initState();
  }

  void executeFetchingApi() {
    // TODO try to fetch data
    _repository.fetchTodoList().then((value) {
      //TODO set items to value
      // WidgetsBinding.instance.addPostFrameCallback is used for refreshing ui after building first time
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
  }

  void floatingButtonTapped() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const AddItemWidget()))
        .then((value) {
      //todo replace with executeFetchingApi to fetch new content if any data is added;
      if (value != null) {
        items.add(TodoItem(text: value));
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset("assets/icons/menu_item.png"),
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
              onUpdateCallback: (bool isSelected) {
                // in flutter we can pass functions as callbacks to other widgets.
                // this is a callback to update the array item
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
