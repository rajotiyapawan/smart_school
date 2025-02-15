import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:smart_school/core/utils/typedef.dart';
import 'package:smart_school/src/authentication/data/models/user_model.dart';
import 'package:smart_school/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('should be a sub class of [User] entity', () {
    //Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;
  group('fromMap', () {
    test('should return [UserModel] with right data', () {
      //Arrange
      //Act
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });
  
  group('fromJson', (){
    test('should return [UserModel] with right data', () {
      //Arrange
      //Act
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group('toMap', (){
    test('should return [Map] with right data', () {
      //Arrange
      //Act
      final result = tModel.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toJson', (){
    test('should return [Json] with right data', () {
      //Arrange
      final testJson = jsonEncode({
        "id": 1,
        "name": "_empty.name",
        "admissionNumber": "_empty.admissionNumber",
        "className": "_empty.className",
        "imgUrl": "_empty.imgUrl"
      });
      //Act
      final result = tModel.toJson();
      expect(result, equals(testJson));
    });
  });

  group('copyWith', (){
    test('should return [UserModel] with right data', () {
      //Arrange
      //Act
      final result = tModel.copyWith(name: 'Paul');
      expect(result.name, equals('Paul'));
    });
  });
}
