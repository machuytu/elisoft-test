import 'package:elisoft/app.dart';
import 'package:elisoft/core/di/injector.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const ElisoftApp());
}
