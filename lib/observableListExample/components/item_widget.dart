import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Título'),
      leading: Checkbox(value: true, onChanged: (bool value) {}, activeColor: Theme.of(context).primaryColor,),
      trailing: IconButton(
        color: Colors.red,
        icon: Icon(Icons.remove_circle),
        onPressed: () => {},
      ),
    );
  }
}
