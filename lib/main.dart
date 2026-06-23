import 'package:chat_app/core/utils/dependecy_injection.dart';
import 'package:chat_app/core/widgets/chat_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection();
  runApp(const ChatApp());
}
