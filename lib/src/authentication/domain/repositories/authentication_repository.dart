import 'package:smart_school/core/utils/typedef.dart';
import 'package:smart_school/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  VoidFuture createUser(
      {required String name,
      required String className,
      required String admissionNumber,
      required String imgUrl});

  ResultFuture<List<User>> getUsers();
}
