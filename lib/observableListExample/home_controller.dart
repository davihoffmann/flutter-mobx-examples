import 'package:flutter_mobx_example/observableListExample/models/item_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: "Item 1", check: true),
    ItemModel(title: "Item 2", check: false),
    ItemModel(title: "Item 3", check: false),
  ].asObservable();

  @action
  void addItem(ItemModel item) {
    listItems.add(item);
  }

  @action
  void removeItem(ItemModel item) {
    listItems.removeWhere((element) => element.title == item.title);
  }

  @computed
  int get totalChecked => listItems.where((element) => element.check).length;

}