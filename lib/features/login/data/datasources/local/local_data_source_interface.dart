import 'package:desafio_os/features/login/data/models/user_validation_model.dart';

abstract class IDataSourcesLocal {
  Future<bool> validateUser(UserValidationModel userValidation);
}
