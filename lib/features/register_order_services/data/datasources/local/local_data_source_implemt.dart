import 'package:desafio_os/core/database/database_helper.dart';
import 'package:desafio_os/features/register_order_services/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/register_order_services/data/models/order_service_model.dart';
import 'package:sqflite/sqflite.dart';

class OrderServiceLocalDataSource implements IOrderServiceLocalDataSource {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<void> saveOrderService(OrderServiceModel orderService) async {
    final db = await _databaseHelper.database;

    await db.insert(
      'order_services',
      orderService.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<OrderServiceModel>> fetchOrderServices() async {
    final db = await _databaseHelper.database;

    final result = await db.query('order_services');

    return result.map((json) => OrderServiceModel.fromJson(json)).toList();
  }
}