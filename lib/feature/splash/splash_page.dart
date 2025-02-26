import 'package:flutter/material.dart';
import 'package:codebase_assignment/base/base_widget.dart';
import 'package:codebase_assignment/di/app/feature_module.dart';
import 'package:codebase_assignment/feature/splash/splash_view_model.dart';
import 'package:codebase_assignment/generated/l10n.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseWidget<SplashViewModel>(
        providerBase: splashViewModelProvider,
        builder: (context, model, child) {
          return Center(
            child: Text(
              S.of(context).welcomeMessage,
            ),
          );
        },
      ),
    );
  }
}
