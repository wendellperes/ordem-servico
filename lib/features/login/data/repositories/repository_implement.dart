import 'package:desafio_os/features/login/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/login/data/datasources/remote/remote_data_source_interface.dart';
import 'package:desafio_os/features/login/data/models/user_validation_model.dart';
import 'package:desafio_os/features/login/data/repositories/repository_interface.dart';

class UserRepository implements IRepository {
  UserRepository(
      {required this.remoteDataSource, required this.localDataSource});
  final IDataSources remoteDataSource;
  final IDataSourcesLocal localDataSource;



  @override
  Future<bool> validateUser({required String email, required String password}) async {
    return await localDataSource.validateUser(
        UserValidationModel(email: email, password: password));
  }

 


  
}
