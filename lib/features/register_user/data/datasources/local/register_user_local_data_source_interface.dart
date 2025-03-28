
import 'package:desafio_os/features/register_user/data/models/user_registration_model.dart';

abstract class IRegisterUserDataSourcesLocal {
  Future<void> registerUser(UserRegistrationModel user);
}
