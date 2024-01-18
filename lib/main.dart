import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/controller.dart';
import 'home.dart';

void main() {
  runApp(MultiProvider(
    providers: [Provider<Controller>(create: (_) => Controller())],
    child: const MaterialApp(
      home: Home(),
    ),
  ));
}
