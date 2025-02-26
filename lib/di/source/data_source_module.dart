import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/data/source/user_remote_source.dart';
import 'package:codebase_assignment/di/network/network_module.dart';

final newsRemoteDataProvider = Provider<UserRemoteSource>(
  (ref) {
    return UserRemoteDataSourceImpl(ref.read(apiServiceProvider));
  },
);
