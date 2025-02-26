import 'package:codebase_assignment/di/usecase/user_module.dart';
import 'package:codebase_assignment/feature/user_list/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/app/navigation/router.dart';
import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:codebase_assignment/generated/l10n.dart';

/// global key for the app
GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');

class App extends ConsumerWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocProvider(
        create: (context) => UserCubit(ref.read(fetchNewsListUseCaseProvider)),
        child: MaterialApp(
          navigatorKey: appLevelKey,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateTitle: (context) => S.of(context).appName,
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePaths.splash,
          onGenerateRoute: NewsRouter.onGenerateRoute,
        ));
  }
}
