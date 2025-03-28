import 'package:desafio_os/core/database/database_helper.dart';
import 'package:desafio_os/features/list_order_services/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/list_order_services/data/models/order_service_model.dart';

class OrderServiceLocalDataSource implements IListOrderServiceLocalDataSource {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<List<OrderServiceModel>> fetchOrderServices() async {
    final db = await _databaseHelper.database;

    final result = await db.query('order_services');

    return result.map((json) => OrderServiceModel.fromJson(json)).toList();
  }
}