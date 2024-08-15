import 'package:flutter/material.dart';

class ListReoderView extends StatefulWidget {
  const ListReoderView({Key? key}) : super(key: key);

  @override
  State<ListReoderView> createState() => _ListReoderViewState();
}

class _ListReoderViewState extends State<ListReoderView> {
  final List<int> itmes = List<int>.generate(30, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView(
          children: List.generate(
              itmes.length,
              (index) => Card(
                    child: ListTile(
                      tileColor: Colors.red,
                      key: Key("$index"),
                      title: Text("dhgh"),
                      trailing: const Icon(Icons.drag_handle_sharp),

// title: Text("Item ${item}"),
                    ),
                  )),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int itme = itmes.removeAt(oldIndex);
              itmes.insert(newIndex, itme);
              // final int itme =itm
            });
          }),
    );
  }
}
