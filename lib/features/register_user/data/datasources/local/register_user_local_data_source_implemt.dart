import 'package:desafio_os/core/database/database_helper.dart';
import 'package:desafio_os/features/register_user/data/datasources/local/register_user_local_data_source_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:desafio_os/features/register_user/data/models/user_registration_model.dart';

class RegisterLocalDataSourceImplemt implements IRegisterUserDataSourcesLocal {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<void> registerUser(UserRegistrationModel user) async {
    final db = await _databaseHelper.database;

    await db.insert(
      'users',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}