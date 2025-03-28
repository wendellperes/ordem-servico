import 'package:desafio_os/core/database/database_helper.dart';
import 'package:desafio_os/features/login/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/login/data/models/user_validation_model.dart';

class LocalDataSourceImplemt implements IDataSourcesLocal {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<bool> validateUser(UserValidationModel userValidation) async {
    final db = await _databaseHelper.database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [userValidation.email, userValidation.password],
    );

    return result.isNotEmpty;
  }
}
