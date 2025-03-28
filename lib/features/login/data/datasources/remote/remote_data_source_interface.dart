
import 'package:desafio_os/features/login/data/models/user_model.dart';

abstract class IDataSources {
  Future<List<UserModel>> fetchUsers();
}
