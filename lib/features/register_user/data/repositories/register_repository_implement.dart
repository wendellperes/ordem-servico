import 'package:desafio_os/features/register_user/data/models/user_registration_model.dart';
import 'package:desafio_os/features/register_user/data/datasources/local/register_user_local_data_source_interface.dart';
import 'package:desafio_os/features/register_user/data/repositories/register_repository_interface.dart';

class RegisterUserRepository implements IRegisterRepository {
  RegisterUserRepository(
      { required this.localDataSource});
  final IRegisterUserDataSourcesLocal localDataSource;

  @override
  Future<void> registerUser(UserRegistrationModel user) async{
    await localDataSource.registerUser(user);
  }


 




  
}
