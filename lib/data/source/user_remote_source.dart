import 'package:codebase_assignment/data/entity/user_list_entity.dart';
import 'package:codebase_assignment/data/network/api_service.dart';
import 'package:retrofit/dio.dart';

abstract class UserRemoteSource {
  Future<HttpResponse<UserListEntity>> fetchUserList({
    required int page,
    required int perPage,
  });
}

class UserRemoteDataSourceImpl extends UserRemoteSource {
  final ApiService _service;

  UserRemoteDataSourceImpl(this._service);

  @override
  Future<HttpResponse<UserListEntity>> fetchUserList({
    required int page,
    required int perPage,
  }) {
    return _service.fetchNewsList(
      page: page,
      perPage: perPage,
    );
  }
}
