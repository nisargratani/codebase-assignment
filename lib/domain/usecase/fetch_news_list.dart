import 'package:dartz/dartz.dart';
import 'package:codebase_assignment/data/entity/user_list_entity.dart';
import 'package:codebase_assignment/domain/repository/news_repository.dart';
import 'package:codebase_assignment/domain/usecase/base_usecase.dart';

class FetchUserListUseCase
    extends BaseUseCase<BaseError, FetchUserListUseCaseParams, UserListEntity> {
  final UserRepository _repository;

  FetchUserListUseCase(this._repository);

  @override
  Future<Either<BaseError, UserListEntity>> execute(
      {required FetchUserListUseCaseParams params}) {
    return _repository.fetchUserList();
  }
}

class FetchUserListUseCaseParams extends Params {
  @override
  Either<BaseError, bool> verify() {
    return const Right(true);
  }
}
