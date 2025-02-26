import 'package:codebase_assignment/data/entity/user_list_entity.dart';
import 'package:codebase_assignment/data/network/api_service.dart';
import 'package:retrofit/dio.dart';

abstract class UserRemoteSource {
  Future<HttpResponse<UserListEntity>> fetchUserList();
}

class UserRemoteDataSourceImpl extends UserRemoteSource {
  final ApiService _service;

  UserRemoteDataSourceImpl(this._service);

  @override
  Future<HttpResponse<UserListEntity>> fetchUserList() {
    return _service.fetchNewsList();
  }
}
