// what does this class depends on -- AuthenticationRepository
// create a fake version of the dependencies -- MockTail
// control what the dependencies do -- using mocktail's api

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_school/core/utils/api_result.dart';
import 'package:smart_school/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:smart_school/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;
  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });
  const params = CreateUserParams.empty();
  test("it should call the [AuthRepo.createUser]", () async {
    // Arrange
    // Stub
    when(() => repository.createUser(
        name: any(named: 'name'),
        className: any(named: 'className'),
        admissionNumber: any(named: 'admissionNumber'),
        imgUrl: any(named: 'imgUrl'))).thenAnswer((_) async => const Success<void>(null));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(const Success<void>(null)));
    verify(() => repository.createUser(
        name: params.name, className: params.className, admissionNumber: params.admissionNumber, imgUrl: params.imgUrl)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
