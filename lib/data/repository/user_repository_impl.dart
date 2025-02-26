import 'package:codebase_assignment/app/api/network_checker.dart';
import 'package:codebase_assignment/app/app.dart';
import 'package:codebase_assignment/app/local_data/hive_service.dart';
import 'package:codebase_assignment/data/entity/user_details_entity.dart';
import 'package:codebase_assignment/generated/l10n.dart';
import 'package:dartz/dartz.dart';
import 'package:codebase_assignment/data/entity/user_list_entity.dart';
import 'package:codebase_assignment/data/source/user_remote_source.dart';
import 'package:codebase_assignment/domain/repository/user_repository.dart';
import 'package:codebase_assignment/domain/usecase/base_usecase.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteSource _remoteDs;

  UserRepositoryImpl(this._remoteDs);

  @override
  Future<Either<BaseError, UserListEntity>> fetchUserList({
    required int page,
    required int perPage,
  }) async {
    if (!await NetworkChecker.hasConnection()) {
      final List<UserDetailsEntity> userList = HiveService.getUserList();
      if (userList.isNotEmpty) {
        if (page == 1) {
          /// if network is not available and page is 1, return the user list from hive
          return Right(
            UserListEntity(userList, 1),
          );
        } else {
          /// if network is not available and page is not 1, return empty list
          return Right(
            UserListEntity([], 1),
          );
        }
      } else {
        /// if hive is empty, return network error
        return Left(
          NetworkError(
            cause: Exception(S.of(appLevelKey.currentContext!).networkError),
          ),
        );
      }
    } else {
      try {
        final result = await _remoteDs.fetchUserList(
          page: page,
          perPage: perPage,
        );

        if (result.response.statusCode != 200) {
          return Left(
            NetworkError(
              cause: Exception(S.of(appLevelKey.currentContext!).commonError),
            ),
          );
        } else {
          await HiveService.saveUserList(result.data.data, page == 1);

          return Right(result.data);
        }
      } on Exception {
        /// if network is available and there is an error, return common error
        return Left(
          NetworkError(
            cause: Exception(S.of(appLevelKey.currentContext!).commonError),
          ),
        );
      }
    }
  }
}
