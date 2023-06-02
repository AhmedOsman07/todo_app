import 'package:flutter/material.dart';

import '../../data/network/api_repo.dart';

class AddItemWidget extends StatefulWidget {
  static String routeName = "/addItemWidget";

  const AddItemWidget({Key? key}) : super(key: key);

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();
  final Repository _repository = Repository();

  @override
  Widget build(BuildContext context) {
    // controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          GestureDetector(
            onTap: () {
              if (controller.text.isEmpty) {
                print("no data found");
              } else {
                //Todo add Api method implemention of adding to api endpoint

                Navigator.of(context).pop(controller.text);
              }
              // print(controller.text);
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }
}
