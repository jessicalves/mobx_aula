import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controllers/controller.dart';
import 'package:mobx_aula/principal.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Controller controller;
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<Controller>(context);
    reactionDisposer = reaction((_) => controller.userLogin, (userLogin) {
      if (userLogin) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => Principal()));
      }
    });
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(labelText: "Senha"),
                onChanged: controller.setPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return Text(controller.formValidate
                      ? "Validado"
                      : "*Campos não Validados");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return ElevatedButton(
                      onPressed: controller.formValidate
                          ? () {
                              controller.login();
                            }
                          : null,
                      child: controller.load
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : const Text(
                              "Logar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
