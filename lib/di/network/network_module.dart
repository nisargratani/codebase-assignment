import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/data/data_constant.dart';
import 'package:codebase_assignment/data/network/api_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final baseOptions = Provider<BaseOptions>(
  (ref) => BaseOptions(
    baseUrl: DataConstant.baseUrl,
    connectTimeout: const Duration(
      seconds: 5,
    ),
  ),
);

final prettyDioLoggerProvider = Provider<PrettyDioLogger>(
  (ref) => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return debugPrint(
        log as String,
      );
    },
  ),
);

final dioProvider = Provider<Dio>(
  (ref) {
    Dio dio = Dio(
      ref.read(
        baseOptions,
      ),
    );
    dio.interceptors.add(
      ref.read(
        prettyDioLoggerProvider,
      ),
    );
    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(
    ref.read(dioProvider),
    baseUrl: DataConstant.baseUrl,
  ),
);
