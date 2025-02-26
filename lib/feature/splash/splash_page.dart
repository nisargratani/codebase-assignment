// ignore_for_file: use_build_context_synchronously

import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:codebase_assignment/feature/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:codebase_assignment/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigating) {
            Navigator.pushReplacementNamed(
              context,
              RoutePaths.userList,
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).welcomeMessage,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
