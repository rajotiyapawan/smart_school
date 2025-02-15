import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_school/core/errors/failure.dart';
import 'package:smart_school/core/utils/api_result.dart';
import 'package:smart_school/src/authentication/domain/entities/user.dart';
import 'package:smart_school/src/authentication/domain/usecases/create_user.dart';
import 'package:smart_school/src/authentication/domain/usecases/get_users.dart';
import 'package:smart_school/src/authentication/presentation/cubit/authentication_cubit.dart';

class MockCreateUser extends Mock implements CreateUser {}

class MockGetUsers extends Mock implements GetUsers {}

void main() {
  late GetUsers getUsers;
  late CreateUser createUser;
  late AuthenticationCubit authenticationCubit;

  const tCreateUserParams = CreateUserParams.empty();
  const tApiFailure = ApiFailure(message: 'Server Failure', statusCode: '500');
  const tUserList = [User.empty()];

  setUp(() {
    getUsers = MockGetUsers();
    createUser = MockCreateUser();
    authenticationCubit = AuthenticationCubit(createUser: createUser, getUsers: getUsers);
    registerFallbackValue(tCreateUserParams);
  });

  tearDown(() => authenticationCubit.close());

  test('initial state should be [AuthenticationInitial]', () async {
    expect(authenticationCubit.state, equals(const AuthenticationInitial()));
  });

  group('createUser', () {
    blocTest<AuthenticationCubit, AuthenticationState>(
        'should emit [CreatingUser, CreatedUserSuccessfully, '
        'AuthenticationError]',
        build: () {
          when(() => createUser(any())).thenAnswer((_) async => const Success<void>(null));
          return authenticationCubit;
        },
        act: (cubit) => cubit.createUsers(
            name: 'name',
            className: 'className',
            admissionNumber: 'a'
                'dmissionNumber',
            imgUrl: 'imgUrl'),
        expect: () => [const CreatingUser(), const UserCreatedSuccessfully()],
        verify: (_) {
          verify(() => createUser(tCreateUserParams)).called(1);
          verifyNoMoreInteractions(createUser);
        });

    blocTest<AuthenticationCubit, AuthenticationState>(
        'should emit [CreatingUser, AuthenticationError]',
        build: () {
          when(() => createUser(any())).thenAnswer((_) async => const Error<void>(tApiFailure));
          return authenticationCubit;
        },
        act: (cubit) => cubit.createUsers(
            name: tCreateUserParams.name,
            className: tCreateUserParams.className,
            admissionNumber: tCreateUserParams.admissionNumber,
            imgUrl: tCreateUserParams.imgUrl),
        expect: () => [const CreatingUser(), AuthenticationError(tApiFailure.errorMessage)],
        verify: (_) {
          verify(() => createUser(tCreateUserParams)).called(1);
          verifyNoMoreInteractions(createUser);
        });
  });

  group('getUsers', () {
    blocTest<AuthenticationCubit, AuthenticationState>(
        'should emit [GettingUsers, UsersLoaded, '
            'AuthenticationError]',
        build: () {
          when(() => getUsers()).thenAnswer((_) async => const Success<List<User>>(tUserList));
          return authenticationCubit;
        },
        act: (cubit) => cubit.getUsers(),
        expect: () => [const GettingUsers(), const UsersLoaded(tUserList)],
        verify: (_) {
          verify(() => getUsers()).called(1);
          verifyNoMoreInteractions(getUsers);
        });

    blocTest<AuthenticationCubit, AuthenticationState>(
        'should emit [GettingUsers, AuthenticationError]',
        build: () {
          when(() => getUsers()).thenAnswer((_) async => const Error<List<User>>(tApiFailure));
          return authenticationCubit;
        },
        act: (cubit) => cubit.getUsers(),
        expect: () => [const GettingUsers(), AuthenticationError(tApiFailure.errorMessage)],
        verify: (_) {
          verify(() => getUsers()).called(1);
          verifyNoMoreInteractions(getUsers);
        });
  });
}
