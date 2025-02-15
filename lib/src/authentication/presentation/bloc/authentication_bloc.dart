import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_school/core/utils/api_result.dart';
import 'package:smart_school/src/authentication/domain/entities/user.dart';
import 'package:smart_school/src/authentication/domain/usecases/create_user.dart';

import '../../domain/usecases/get_users.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required CreateUser createUser, required GetUsers getUsers})
      : _getUsers = getUsers,
        _createUser = createUser,
        super(const AuthenticationInitial()) {
    on<CreateUserEvent>(_createUserHandler);
    on<GetUsersEvent>(_getUsersHandler);
  }

  final CreateUser _createUser;
  final GetUsers _getUsers;

  Future<void> _createUserHandler(CreateUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(const CreatingUser());

    final result = await _createUser(CreateUserParams(
        name: event.name,
        className: event.className,
        admissionNumber: event.admissionNumber,
        imgUrl: event.imgUrl));
    if (result is Success<void>) {
      emit(const UserCreatedSuccessfully());
    } else if (result is Error<void>){
      emit(AuthenticationError(result.failure.errorMessage));
    }
  }

  Future<void> _getUsersHandler(GetUsersEvent event, Emitter<AuthenticationState> emit) async {
    emit(const GettingUsers());

    final result = await _getUsers();
    if (result is Success<List<User>>) {
      emit(UsersLoaded(result.data));
    } else if (result is Error<List<User>>){
      emit(AuthenticationError(result.failure.errorMessage));
    }
  }
}
