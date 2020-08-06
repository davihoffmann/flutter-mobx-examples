import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/observableListExample/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  final Function removeClicked;

  ItemWidget({this.item, this.removeClicked});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListTile(
        title: Text(item.title),
        leading: Checkbox(
          value: item.check,
          onChanged: item.setCheck,
          activeColor: Theme.of(context).primaryColor,
        ),
        trailing: IconButton(
          color: Colors.red,
          icon: Icon(Icons.remove_circle),
          onPressed: removeClicked,
        ),
      );
    });
  }
}
