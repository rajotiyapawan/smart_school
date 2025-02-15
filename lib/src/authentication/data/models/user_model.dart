import 'dart:convert';

import 'package:smart_school/core/utils/typedef.dart';
import 'package:smart_school/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.admissionNumber,
    required super.className,
    required super.imgUrl,
  });

  const UserModel.empty():
        this(id: 1, name: '_empty.name',admissionNumber: '_empty.admissionNumber',className: '_empty.className',imgUrl: '_empty.imgUrl');

  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map) :
        this(
        id: map['id'] as int,
        name: map['name'] as String,
        admissionNumber: map['admissionNumber'] as String,
        className: map['className'] as String,
        imgUrl: map['imgUrl'] as String,
      );

  UserModel copyWith({
    int? id, String? name, String? admissionNumber, String? className, String? imgUrl
  }) {
    return UserModel(id: id ?? this.id,
        name: name ?? this.name,
        admissionNumber: admissionNumber ?? this.admissionNumber,
        className: className ?? this.className,
        imgUrl: imgUrl ?? this.imgUrl);
  }

  DataMap toMap() =>
      {
        'id': id,
        'name': name,
        'admissionNumber': admissionNumber,
        'className': className,
        'imgUrl': imgUrl
      };

  String toJson() => jsonEncode(toMap());

}
