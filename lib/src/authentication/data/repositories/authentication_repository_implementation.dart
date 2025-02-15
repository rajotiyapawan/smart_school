import 'package:smart_school/core/errors/failure.dart';
import 'package:smart_school/core/utils/api_result.dart';
import 'package:smart_school/core/utils/typedef.dart';
import 'package:smart_school/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:smart_school/src/authentication/domain/entities/user.dart';
import 'package:smart_school/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  VoidFuture createUser(
      {required String name,
      required String className,
      required String admissionNumber,
      required String imgUrl}) async {
    try {
      await _remoteDataSource.createUser(
          name: name, className: className, admissionNumber: admissionNumber, imgUrl: imgUrl);
      return const Success<void>(null);
    } on ApiFailure catch (e) {
      return Error<void>(e);
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      var response = await _remoteDataSource.getUsers();
      return Success<List<User>>(response);
    } on ApiFailure catch (e) {
      return Error<List<User>>(e);
    }
  }
}
