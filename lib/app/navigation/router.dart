import 'package:flutter/cupertino.dart';
import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:codebase_assignment/feature/news_details/news_details.dart';
import 'package:codebase_assignment/feature/news_list/news_list.dart';
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
            builder: (context) => const NewsListPage(),
            settings: const RouteSettings(name: RoutePaths.userList));

      case RoutePaths.userDetails:
        return CupertinoPageRoute(
            builder: (context) => const NewsDetailsPage(),
            settings: const RouteSettings(name: RoutePaths.userDetails));

      default:
        return CupertinoPageRoute(
          builder: (context) {
            return Center(child: Text(S.of(context).pageNotFound));
          },
        );
    }
  }
}
