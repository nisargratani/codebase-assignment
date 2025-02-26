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
    final result = await _remoteDs.fetchUserList(
      page: page,
      perPage: perPage,
    );

    if (result.response.statusCode != 200) {
      return Left(NetworkError(cause: Exception("Something Went Wrong")));
    }

    return Right(result.data);
  }
}
