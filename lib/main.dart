import 'package:codebase_assignment/app/local_data/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/app/app.dart';

/// This is the main entry point of the application.
/// It initializes the Hive database and runs the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// This is the main widget of the application.
/// It builds the app using the App widget.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
