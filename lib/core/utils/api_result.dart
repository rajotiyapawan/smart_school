import 'package:equatable/equatable.dart';
import 'package:smart_school/core/errors/failure.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

/// Represents a successful API response
class Success<T> extends ApiResult<T> with EquatableMixin {
  final T data;
  const Success(this.data);

  @override
  List<Object?> get props => [data];
}

/// Represents a loading state while API is fetching data
class Loading<T> extends ApiResult<T> {
  const Loading();
}

/// Represents an error response from the API
class Error<T> extends ApiResult<T> with EquatableMixin{
  final Failure failure;
  const Error(this.failure);

  @override
  List<Object?> get props => [failure];
}
