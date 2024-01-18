import 'package:mobx/mobx.dart';
part 'item_controller.g.dart';

class ItemController = ItemControllerBase with _$ItemController;

abstract class ItemControllerBase with Store {
  ItemControllerBase(this.title);

  final String title;

  @observable
  bool checked = false;

  @action
  void changeCheckedUnchecked(bool value) => checked = value;
}
