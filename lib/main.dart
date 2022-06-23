// ignore_for_file: depend_on_referenced_packages

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
