import 'package:get_it/get_it.dart';
import 'package:smart_school/core/network/dio_client.dart';
import 'package:smart_school/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:smart_school/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:smart_school/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:smart_school/src/authentication/domain/usecases/create_user.dart';
import 'package:smart_school/src/authentication/domain/usecases/get_users.dart';
import 'package:smart_school/src/authentication/presentation/cubit/authentication_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator
    // app logic
    ..registerFactory(
        () => AuthenticationCubit(createUser: serviceLocator(), getUsers: serviceLocator()))

    // usecases
    ..registerLazySingleton(() => CreateUser(serviceLocator()))
    ..registerLazySingleton(() => GetUsers(serviceLocator()))

    // repositories
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImplementation(serviceLocator()))

    // data sources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImplementation(serviceLocator()))

    // network client or external dependencies
    // ..registerLazySingleton(() => DioClient());
    ..registerLazySingleton(DioClient.new);
}
