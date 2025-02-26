import 'package:codebase_assignment/feature/user_details/user_details_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/di/usecase/news_module.dart';
import 'package:codebase_assignment/feature/news_list/user_list_view_model.dart';
import 'package:codebase_assignment/feature/splash/splash_view_model.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) {
    return SplashViewModel();
  },
);

final newsListViewModelProvider =
    ChangeNotifierProvider.autoDispose<NewsListViewModel>(
  (ref) {
    return NewsListViewModel(ref.read(fetchNewsListUseCaseProvider));
  },
);

final userDetailsViewModelProvider =
    ChangeNotifierProvider.autoDispose<UserDetailsViewModel>(
  (ref) {
    return UserDetailsViewModel();
  },
);
