part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class CreateUserEvent extends AuthenticationEvent {
  const CreateUserEvent(
      {required this.id,
      required this.name,
      required this.className,
      required this.admissionNumber,
      required this.imgUrl});

  final String id;
  final String name;
  final String className;
  final String admissionNumber;
  final String imgUrl;

  @override
  List<Object?> get props => [id, name, admissionNumber, className];
}

class GetUsersEvent extends AuthenticationEvent {
  const GetUsersEvent();
}
