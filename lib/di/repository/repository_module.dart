import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/data/repository/user_repository_impl.dart';
import 'package:codebase_assignment/di/source/data_source_module.dart';
import 'package:codebase_assignment/domain/repository/user_repository.dart';

final newsRepositoryProvider = Provider<UserRepository>(
  (ref) {
    return UserRepositoryImpl(ref.read(newsRemoteDataProvider));
  },
);
