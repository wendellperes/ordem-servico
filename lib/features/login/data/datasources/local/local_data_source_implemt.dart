import 'package:desafio_os/core/database/database_helper.dart';
import 'package:desafio_os/features/login/data/datasources/local/local_data_source_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:desafio_os/features/register_user/data/models/user_registration_model.dart';
import 'package:desafio_os/features/login/data/models/user_validation_model.dart';
import 'package:desafio_os/features/login/data/models/user_authentication_model.dart';

class LocalDataSourceImplemt implements IDataSourcesLocal {
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

  @override
  Future<void> sendRegistrationConfirmation(String email) async {
    // Simulação de envio de email (pode ser integrado com um serviço de email)
    print('Confirmation email sent to $email');
  }

  @override
  Future<bool> authenticateUser(UserAuthenticationModel userAuth) async {
    final db = await _databaseHelper.database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [userAuth.email, userAuth.password],
    );

    return result.isNotEmpty;
  }

 
}