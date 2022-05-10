import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_recrutamento/app/app_module.dart';
import 'package:flutter_test_recrutamento/app/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(), 
      child: const AppWidget(),
    ),
  );
}