import 'package:smart_school/core/utils/api_result.dart';

typedef ResultFuture<T> = Future<ApiResult<T>>;
typedef VoidFuture = Future<ApiResult<void>>;
typedef DataMap = Map<String, dynamic>;