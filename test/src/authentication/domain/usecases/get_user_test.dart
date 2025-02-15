import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_school/core/utils/api_result.dart';
import 'package:smart_school/src/authentication/domain/entities/user.dart';
import 'package:smart_school/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:smart_school/src/authentication/domain/usecases/get_users.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test("should call the [AuthRepo.GetUsers] and returns [List<User>]", () async {
    //Arrange
    when(() => repository.getUsers()).thenAnswer((_) async => const Success(tResponse));

    //Act
    final result = await usecase();

    //Assert
    expect(result, equals(const Success(tResponse))); // gives the result we wants
    verify(()=> repository.getUsers()).called(1); // only called once
    verifyNoMoreInteractions(repository); // no more interaction with the repository
  });
}
