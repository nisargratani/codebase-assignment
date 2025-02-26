import 'package:flutter/cupertino.dart';
import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:codebase_assignment/feature/user_details/user_details.dart';
import 'package:codebase_assignment/feature/user_list/user_list.dart';
import 'package:codebase_assignment/feature/splash/splash_page.dart';
import 'package:codebase_assignment/generated/l10n.dart';

class NewsRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashPage(),
            settings: const RouteSettings(name: RoutePaths.splash));

      case RoutePaths.userList:
        return CupertinoPageRoute(
            builder: (context) => const UserListView(),
            settings: const RouteSettings(name: RoutePaths.userList));

      case RoutePaths.userDetails:
        return CupertinoPageRoute(
          builder: (context) => UserDetailsScreen(
            arguments: settings.arguments as UserDetailsArguments,
          ),
          settings: const RouteSettings(
            name: RoutePaths.userDetails,
          ),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) {
            return Center(child: Text(S.of(context).pageNotFound));
          },
        );
    }
  }
}
