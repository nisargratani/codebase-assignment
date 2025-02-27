import 'package:dio/dio.dart';
import 'package:codebase_assignment/data/entity/user_list_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('/users')
  Future<HttpResponse<UserListEntity>> fetchUserList({
    @Query('page') required int page,
    @Query('per_page') required int perPage,
  });
}
