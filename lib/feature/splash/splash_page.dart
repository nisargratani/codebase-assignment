// ignore_for_file: use_build_context_synchronously

import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:codebase_assignment/generated/l10n.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startSplashProgress(context);
    });
  }

  void startSplashProgress(
    BuildContext context,
  ) {
    Future.delayed(Duration(seconds: 1)).then(
      (value) {
        Navigator.pushReplacementNamed(context, RoutePaths.userList);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        S.of(context).welcomeMessage,
      ),
    ));
  }
}
