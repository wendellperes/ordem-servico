import 'package:desafio_os/features/register_order_services/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/register_order_services/data/models/order_service_model.dart';
import 'package:desafio_os/features/register_order_services/data/repositories/repository_interface.dart';

class OrderServiceRepository implements IOrderServiceRepository {
  final IOrderServiceLocalDataSource localDataSource;

  OrderServiceRepository({
    required this.localDataSource,
  });

  @override
  Future<bool> saveOrderService({
    required String title,
    required String description,
    required String checklistOption,
    required String photoPath,
  }) async {
   try {
      final orderService = OrderServiceModel(
        title: title,
        description: description,
        checklistOption: checklistOption,
        photoPath: photoPath,
      );
      await localDataSource.saveOrderService(orderService);
      return true;
    } catch (e) {
      // Handle the error appropriately
      print('Error saving order service: $e');
      return false;
    }
  }

  @override
  Future<List<OrderServiceModel>> fetchOrderServices() async {
    return await localDataSource.fetchOrderServices();
  }

  @override
  Future<void> sendOrderService(OrderServiceModel orderService) async {
    // await remoteDataSource.sendOrderService(orderService);
  }
}