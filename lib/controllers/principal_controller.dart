import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controllers/item_controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

abstract class PrincipalControllerBase with Store {
  @observable
  String newItem = "";

  @action
  void setNewItem(String value) => newItem = value;

  ObservableList<ItemController> listItens = ObservableList<ItemController>();

  @action
  void addItem() {
    listItens.add(ItemController(newItem));
  }
}
