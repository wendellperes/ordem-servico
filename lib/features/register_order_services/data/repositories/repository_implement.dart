import 'package:desafio_os/features/register_order_services/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/register_order_services/data/datasources/remote/remote_data_source_interface.dart';
import 'package:desafio_os/features/register_order_services/data/models/order_service_model.dart';
import 'package:desafio_os/features/register_order_services/data/repositories/repository_interface.dart';

class OrderServiceRepository implements IOrderServiceRepository {
  final IOrderServiceLocalDataSource localDataSource;
  final IOrderServiceRemoteDataSource remoteDataSource;

  OrderServiceRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> saveOrderService(OrderServiceModel orderService) async {
    await localDataSource.saveOrderService(orderService);
  }

  @override
  Future<List<OrderServiceModel>> fetchOrderServices() async {
    return await localDataSource.fetchOrderServices();
  }

  @override
  Future<void> sendOrderService(OrderServiceModel orderService) async {
    await remoteDataSource.sendOrderService(orderService);
  }
}