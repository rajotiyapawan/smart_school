// 1. return the correct data when the server response is correct
// 2. check to make sure that it throws a custom exception with the right message when status code
// is bad.

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_school/core/errors/failure.dart';
import 'package:smart_school/core/network/dio_client.dart';
import 'package:smart_school/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:smart_school/src/authentication/data/models/user_model.dart';

class MockDioClient extends Mock implements DioClient {}

void main() {
  late DioClient dioClient;
  late AuthenticationRemoteDataSource remoteDataSource;
  setUp(() {
    dioClient = MockDioClient();
    remoteDataSource = AuthenticationRemoteDataSourceImplementation(dioClient);
  });

  group('createUSer', () {
    // create a fake response
    final tResponse = Response(
        data: '',
        requestOptions: RequestOptions(),
        statusCode: 200,
        statusMessage: 'user created successfully');
    test('should complete successfully when the status code is good', () async {
      // Arrange or stub
      when(() => dioClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => tResponse);

      // Act
      final methodCall = remoteDataSource.createUser;

      // Assert
      //checking the method completes successfully
      expect(
          methodCall(
              name: 'name',
              className: 'className',
              admissionNumber: 'admissionNumber',
              imgUrl: 'imgUrl'),
          completes);
      verify(()=> dioClient.post(kCreateUserUrl, body: jsonEncode({
        'name': 'name',
        'className': 'className',
        'admissionNumber': 'admissionNumber',
        'imgUrl': 'imgUrl'
      }))).called(1);
      verifyNoMoreInteractions(dioClient);
    });

    test('should throws [ApiFailure] when the status code is bad', () async {
      // Arrange or stub
      when(() => dioClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => Response(
          data: '',
          requestOptions: RequestOptions(),
          statusCode: 500,
          statusMessage: 'invalid request'));

      // Act
      final methodCall = remoteDataSource.createUser(
          name: 'name',
          className: 'className',
          admissionNumber: 'admissionNumber',
          imgUrl: 'imgUrl');

      // Assert
      //checking the method completes successfully
      expect( () =>
          methodCall,
          throwsA(const ApiFailure(message: 'invalid request', statusCode: '500')));

      verify(()=> dioClient.post(kCreateUserUrl, body: jsonEncode({
        'name': 'name',
        'className': 'className',
        'admissionNumber': 'admissionNumber',
        'imgUrl': 'imgUrl'
      }))).called(1);
      verifyNoMoreInteractions(dioClient);
    });
  });

  group('getUsers', () {
    // create a fake response
    const tUserModelList = [UserModel.empty()];
    final tResponse = Response(
        data: jsonEncode([tUserModelList.first.toMap()]),//jsonEncode(tUserModelList.map((it)=>it.toMap()).toList()),
        requestOptions: RequestOptions(),
        statusCode: 200,
        statusMessage: 'user created successfully');

    test('should return [List<UserModel>] successfully when the status code is good', () async {
      // Arrange or stub
      when(() => dioClient.get(any()))
          .thenAnswer((_) async => tResponse);

      // Act
      final result = await remoteDataSource.getUsers();

      // Assert
      //checking the method completes successfully
      expect(result, equals(tUserModelList));
      verify(()=> dioClient.get(kGetUsersUrl)).called(1);
      verifyNoMoreInteractions(dioClient);
    });

    test('should throws [ApiFailure] when the status code is bad', () async {
      // Arrange or stub
      when(() => dioClient.get(any()))
          .thenAnswer((_) async => Response(
          data: '',
          requestOptions: RequestOptions(),
          statusCode: 500,
          statusMessage: 'invalid request'));

      // Act
      final methodCall = remoteDataSource.getUsers();

      // Assert
      //checking the method completes successfully
      expect( () =>
      methodCall,
          throwsA(const ApiFailure(message: 'invalid request', statusCode: '500')));

      verify(()=> dioClient.get(kGetUsersUrl)).called(1);
      verifyNoMoreInteractions(dioClient);
    });
  });

}
