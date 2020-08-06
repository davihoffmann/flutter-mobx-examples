import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/observableListExample/components/item_widget.dart';
import 'package:flutter_mobx_example/observableListExample/home_controller.dart';
import 'package:flutter_mobx_example/observableListExample/models/item_model.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = HomeController();

  _dialog() {
    var model = ItemModel();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Adicionar Item'),
          content: TextField(
            onChanged: model.setTitle,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Novo Item'),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                controller.addItem(model);
                Navigator.pop(context);
              },
              child: Text(
                'Salvar',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: "Pesquisa..."),
        ),
        actions: <Widget>[
          Observer(builder: (context) {
            return IconButton(
              icon: Text("${controller.totalChecked}"),
              onPressed: () => {},
            );
          })
        ],
      ),
      body: Observer(builder: (context) {
        return ListView.builder(
          itemCount: controller.listItems.length,
          itemBuilder: (context, index) {
            var item = controller.listItems[index];
            return ItemWidget(
              item: item,
              removeClicked: () => controller.removeItem(item),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => _dialog(),
      ),
    );
  }
}
