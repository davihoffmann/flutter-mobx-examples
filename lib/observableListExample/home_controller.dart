import 'package:flutter_mobx_example/observableListExample/models/item_model.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final listItems = BehaviorSubject<List<ItemModel>>.seeded([]);
  final filter = BehaviorSubject<String>.seeded('');

  ObservableStream<List<ItemModel>> output;

  _HomeControllerBase() {
    output = Rx.combineLatest2<List<ItemModel>, String, List<ItemModel>>(
      listItems.stream,
      filter.stream,
      (list, filter) {
        if (filter.isEmpty) {
          return list;
        } else {
          return list
              .where((item) =>
                  item.title.toLowerCase().contains(filter.toLowerCase()))
              .toList();
        }
      },
    ).asObservable(initialValue: []);
  }

  @computed
  int get totalChecked => output.value.where((element) => element.check).length;

  @action
  void setFilter(String value) => filter.add(value);

  @action
  void addItem(ItemModel item) {
    var list = List<ItemModel>.from(listItems.value);
    list.add(item);
    listItems.add(list);
  }

  @action
  void removeItem(ItemModel item) {
    var list = List<ItemModel>.from(listItems.value);
    list.removeWhere((element) => element.title == item.title);
    listItems.add(list);
  }

  /*
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

  @observable
  String filter = '';

  @action
  void setFilter(String value) => filter = value;

  @computed
  List<ItemModel> get listFiltered {
    if(filter.isEmpty) {
      return listItems;
    } else {
      return listItems.where((item) => item.title.toLowerCase().contains(filter.toLowerCase())).toList();
    }
  }*/

}
