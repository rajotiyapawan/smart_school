import 'dart:convert';

import 'package:smart_school/core/errors/failure.dart';
import 'package:smart_school/core/network/dio_client.dart';
import 'package:smart_school/core/utils/typedef.dart';
import 'package:smart_school/src/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser(
      {required String name,
      required String className,
      required String admissionNumber,
      required String imgUrl});

  Future<List<UserModel>> getUsers();
}

const kCreateUserUrl = '/users';
const kGetUsersUrl = '/users';

class AuthenticationRemoteDataSourceImplementation implements AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSourceImplementation(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<void> createUser(
      {required String name,
      required String className,
      required String admissionNumber,
      required String imgUrl}) async {
    try {
      final response = await _dioClient.post(
        kCreateUserUrl,
        body: jsonEncode({
          'name': name,
          'className': className,
          'admissionNumber': admissionNumber,
          'imgUrl': imgUrl
        }),
      );
      if (response.statusCode != 200) {
        throw ApiFailure(
          message: response.statusMessage ?? "",
          statusCode: '${response.statusCode}',
        );
      }
    } on ApiFailure {
      rethrow;
    } catch (e) {
      throw ApiFailure(
        message: e.toString(),
        statusCode: '505', // this error is from our side
      );
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _dioClient.get(kGetUsersUrl);
      if (response.statusCode != 200) {
        throw ApiFailure(
          message: response.statusMessage ?? "",
          statusCode: '${response.statusCode}',
        );
      } else {
        return List<DataMap>.from(jsonDecode(response.data) as List)
            .map((userData) => UserModel.fromMap(userData))
            .toList();
      }
     } on ApiFailure {
      rethrow;
    } catch (e) {
      throw ApiFailure(
        message: e.toString(),
        statusCode: '505', // this error is from our side
      );
    }
  }
}
