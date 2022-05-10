import 'package:device_preview/device_preview.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_recrutamento/app/app_module.dart';
import 'package:flutter_test_recrutamento/app/app_widget.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ModularApp(
        module: AppModule(), 
        child: const AppWidget(),
      )
    )
  );
}