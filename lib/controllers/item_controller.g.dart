// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemController on ItemControllerBase, Store {
  late final _$checkedAtom =
      Atom(name: 'ItemControllerBase.checked', context: context);

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  late final _$ItemControllerBaseActionController =
      ActionController(name: 'ItemControllerBase', context: context);

  @override
  void changeCheckedUnchecked(bool value) {
    final _$actionInfo = _$ItemControllerBaseActionController.startAction(
        name: 'ItemControllerBase.changeCheckedUnchecked');
    try {
      return super.changeCheckedUnchecked(value);
    } finally {
      _$ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checked: ${checked}
    ''';
  }
}
