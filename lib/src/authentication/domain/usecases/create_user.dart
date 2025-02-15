import 'package:equatable/equatable.dart';
import 'package:smart_school/core/usecase/usecase.dart';
import 'package:smart_school/src/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/utils/typedef.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture call(CreateUserParams params) async {
    return _repository.createUser(
        name: params.name,
        className: params.className,
        admissionNumber: params.admissionNumber,
        imgUrl: params.imgUrl);
  }
}

class CreateUserParams extends Equatable {
  const CreateUserParams(
      {required this.name,
      required this.className,
      required this.admissionNumber,
      required this.imgUrl});

  final String name;
  final String className;
  final String admissionNumber;
  final String imgUrl;

  const CreateUserParams.empty()
      : this(
            name: 'name',
            className: 'className',
            admissionNumber: 'admissionNumber',
            imgUrl: 'imgUrl');

  @override
  List<Object?> get props => [name, className, admissionNumber, imgUrl];
}
