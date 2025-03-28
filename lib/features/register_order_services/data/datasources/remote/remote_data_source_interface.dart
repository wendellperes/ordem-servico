import 'package:desafio_os/features/register_order_services/data/models/order_service_model.dart';

abstract class IOrderServiceRemoteDataSource {
  Future<void> sendOrderService(OrderServiceModel orderService);
}