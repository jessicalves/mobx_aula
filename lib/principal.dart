import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/controllers/principal_controller.dart';
import 'package:provider/provider.dart';

import 'controllers/controller.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  PrincipalController principalController = PrincipalController();

  _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Adicionar item"),
            content: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite uma descrição..."),
              onChanged: principalController.setNewItem,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    principalController.addItem();
                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.email,
          style: const TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: principalController.listItens.length,
            itemBuilder: (_, indice) {
              var item = principalController.listItens[indice];
              return Observer(builder: (_) {
                return ListTile(
                  title: Text(
                    item.title,
                    style: TextStyle(
                        decoration:
                            item.checked ? TextDecoration.lineThrough : null),
                  ),
                  leading: Checkbox(
                    value: item.checked,
                    onChanged: (_) {
                      item.changeCheckedUnchecked;
                    },
                  ),
                  onTap: () {
                    item.checked = !item.checked;
                  },
                );
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
