import 'package:dartz/dartz.dart';
import 'package:codebase_assignment/data/entity/user_list_entity.dart';
import 'package:codebase_assignment/domain/usecase/base_usecase.dart';

abstract class UserRepository {
  Future<Either<BaseError, UserListEntity>> fetchUserList({
    required int page,
    required int perPage,
  });
}
