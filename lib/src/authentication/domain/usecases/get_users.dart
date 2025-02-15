import 'package:smart_school/core/usecase/usecase.dart';
import 'package:smart_school/src/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';

class GetUsers extends UseCaseWithOutParams<List<User>> {
  const GetUsers(this.repository);

  final AuthenticationRepository repository;

  @override
  ResultFuture<List<User>> call() {
    return repository.getUsers();
  }
}