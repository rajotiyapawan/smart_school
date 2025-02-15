import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/api_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/create_user.dart';
import '../../domain/usecases/get_users.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({required CreateUser createUser, required GetUsers getUsers})
      : _getUsers = getUsers,
        _createUser = createUser,
        super(const AuthenticationInitial());

  final CreateUser _createUser;
  final GetUsers _getUsers;

  Future<void> createUsers(
      {required String name,
      required String className,
      required String admissionNumber,
      required String imgUrl}) async {
    emit(const CreatingUser());

    final result = await _createUser(CreateUserParams(
        name: name, className: className, admissionNumber: admissionNumber, imgUrl: imgUrl));
    if (result is Success<void>) {
      emit(const UserCreatedSuccessfully());
    } else if (result is Error<void>) {
      emit(AuthenticationError(result.failure.errorMessage));
    }
  }

  Future<void> getUsers() async {
    emit(const GettingUsers());

    final result = await _getUsers();
    if (result is Success<List<User>>) {
      emit(UsersLoaded(result.data));
    } else if (result is Error<List<User>>) {
      emit(AuthenticationError(result.failure.errorMessage));
    }
  }
}
