import 'package:desafio_os/features/home/presentation/home/home_controller.dart';
import 'package:desafio_os/features/login/data/datasources/local/local_data_source_implemt.dart';
import 'package:desafio_os/features/login/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/login/data/datasources/remote/remote_data_source.dart';
import 'package:desafio_os/features/login/data/datasources/remote/remote_data_source_interface.dart';
import 'package:desafio_os/features/login/data/repositories/repository_implement.dart';
import 'package:desafio_os/features/login/data/repositories/repository_interface.dart';
import 'package:desafio_os/features/register_user/data/datasources/local/register_user_local_data_source_implemt.dart';
import 'package:desafio_os/features/register_user/data/datasources/local/register_user_local_data_source_interface.dart';
import 'package:desafio_os/features/register_user/data/repositories/register_repository_implement.dart';
import 'package:desafio_os/features/register_user/data/repositories/register_repository_interface.dart';
import 'package:desafio_os/features/register_user/presentation/create_user_page/create_user_controller.dart';
import 'package:desafio_os/features/login/presentation/login_page/login_controller.dart';
import 'package:desafio_os/features/register_order_services/data/datasources/local/local_data_source_implemt.dart';
import 'package:desafio_os/features/register_order_services/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/register_order_services/data/repositories/repository_implement.dart';
import 'package:desafio_os/features/register_order_services/data/repositories/repository_interface.dart';
import 'package:desafio_os/features/register_order_services/presentation/create_order_service_controller.dart';
import 'package:get_it/get_it.dart';

void setupRegisterDependencies() {
  GetIt.instance
    ..registerFactory<IDataSources>(
      () => UserRemoteDataSource(),
    )
    ..registerLazySingleton<IDataSourcesLocal>(
      () => LocalDataSourceImplemt(),
    )
    ..registerLazySingleton<IRegisterUserDataSourcesLocal>(
      () => RegisterLocalDataSourceImplemt(),
    )
    ..registerFactory<IRepository>(
      () => UserRepository(
        remoteDataSource: GetIt.instance.get<IDataSources>(),
        localDataSource: GetIt.instance.get<IDataSourcesLocal>(),
      ),
    )
    ..registerFactory<IRegisterRepository>(
      () => RegisterUserRepository(
        localDataSource: GetIt.instance.get<IRegisterUserDataSourcesLocal>(),
      ),
    )
    ..registerFactory<CreateUserController>(
      () => CreateUserController(
        repository: GetIt.instance.get<IRegisterRepository>(),
      ),
    )
    ..registerFactory<HomeController>(
      () => HomeController(
        repository: GetIt.instance.get(),
      ),
    )
    ..registerLazySingleton<IOrderServiceLocalDataSource>(
      () => OrderServiceLocalDataSource(),
    )
    
    ..registerFactory<IOrderServiceRepository>(
      () => OrderServiceRepository(
        localDataSource: GetIt.instance.get<IOrderServiceLocalDataSource>(),
      ),
    )
    ..registerFactory<CreateOrderServiceController>(
      () => CreateOrderServiceController(
        repository: GetIt.instance.get<IOrderServiceRepository>(), 
      ),
    )
    ..registerFactory<LoginController>(
      () => LoginController(
        repository: GetIt.instance.get(),
      ),
    );
}
