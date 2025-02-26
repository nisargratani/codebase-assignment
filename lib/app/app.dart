import 'package:codebase_assignment/di/usecase/news_module.dart';
import 'package:codebase_assignment/feature/news_list/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/app/app_viewmodel.dart';
import 'package:codebase_assignment/app/navigation/router.dart';
import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:codebase_assignment/base/base_widget.dart';
import 'package:codebase_assignment/di/app/app_module.dart';
import 'package:codebase_assignment/generated/l10n.dart';

GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocProvider(
      create: (context) => UserCubit(ref.read(fetchNewsListUseCaseProvider)),
      child: BaseWidget<AppViewModel>(
        providerBase: appViewModelProvider,
        builder: (context, model, child) {
          return MaterialApp(
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
          );
        },
      ),
    );
  }
}
