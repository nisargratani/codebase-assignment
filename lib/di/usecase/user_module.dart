import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/di/repository/repository_module.dart';
import 'package:codebase_assignment/domain/usecase/fetch_user_list.dart';

var fetchNewsListUseCaseProvider = Provider.autoDispose<FetchUserListUseCase>(
  (ref) {
    return FetchUserListUseCase(ref.read(newsRepositoryProvider));
  },
);
