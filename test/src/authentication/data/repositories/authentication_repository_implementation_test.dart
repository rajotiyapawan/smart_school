// call the expected remote data source
// check if the method returns the proper data
// check if when the remote data source throws an exception, we return a failure and if it
// doesn't throw an exception we return the actual expected data

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_school/core/errors/failure.dart';
import 'package:smart_school/core/utils/api_result.dart';
import 'package:smart_school/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:smart_school/src/authentication/data/models/user_model.dart';
import 'package:smart_school/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:smart_school/src/authentication/domain/entities/user.dart';

class MockAuthRemoteSource extends Mock implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementation repoImpl;

  setUp(() {
    remoteDataSource = MockAuthRemoteSource();
    repoImpl = AuthenticationRepositoryImplementation(remoteDataSource);
  });

  const tException = ApiFailure(message: 'Unknown Error', statusCode: '500');

  group('createUser', () {
    const name = 'test.name';
    const className = 'test.className';
    const admissionNumber = 'test.admissionNumber';
    const imgUrl = 'test.imgUrl ';

    test(
        'should call [AuthenticationRemoteDataSource.createUser] and complete successfully '
        'when the call is successful', () async {
      // Arrange
      when(() => remoteDataSource.createUser(
          name: any(named: 'name'),
          className: any(
              named: 'clas'
                  'sName'),
          admissionNumber: any(named: 'admissionNumber'),
          imgUrl: any(named: 'imgUrl'))).thenAnswer((_) async => Future.value());

      //Act
      final result = await repoImpl.createUser(
          name: name, className: className, admissionNumber: admissionNumber, imgUrl: imgUrl);

      // Assert
      expect(result, equals(const Success<void>(null)));
      verify(() => remoteDataSource.createUser(
          name: name,
          className: className,
          admissionNumber: admissionNumber,
          imgUrl: imgUrl)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should call [ServerFailure] when the call to remote source is unsuccessful', () async {
      // Arrange
      when(() => remoteDataSource.createUser(
          name: any(named: 'name'),
          className: any(
              named: 'clas'
                  'sName'),
          admissionNumber: any(named: 'admissionNumber'),
          imgUrl: any(named: 'imgUrl'))).thenThrow(tException);

      //Act
      final result = await repoImpl.createUser(
          name: name, className: className, admissionNumber: admissionNumber, imgUrl: imgUrl);

      // Assert
      expect(
          result,
          equals(Error<void>(
              ApiFailure(message: tException.message, statusCode: tException.statusCode))));
      verify(() => remoteDataSource.createUser(
          name: name,
          className: className,
          admissionNumber: admissionNumber,
          imgUrl: imgUrl)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('getUsers', () {
    const userModel1 = UserModel.empty();

    test(
        'should call [AuthenticationRemoteDataSource.getUsers] and return [List<UserModel>]'
        'when the call is successful', () async {
      // Arrange
      when(() => remoteDataSource.getUsers())
          .thenAnswer((_) async => [userModel1]);

      //Act
      final result = await repoImpl.getUsers();

      // Assert
      expect(result, equals(const Success<List<User>>([userModel1])));
      verify(() => remoteDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should call [ServerFailure] when the call to remote source is unsuccessful', () async {
      // Arrange
      when(() => remoteDataSource.getUsers()).thenThrow(tException);

      //Act
      final result = await repoImpl.getUsers();

      // Assert
      expect(
          result,
          equals(Error<List<User>>(
              ApiFailure(message: tException.message, statusCode: tException.statusCode))));
      verify(() => remoteDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
