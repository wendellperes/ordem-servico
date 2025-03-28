import 'package:desafio_os/features/register_order_services/data/models/order_service_model.dart';

abstract class IOrderServiceRepository {
  Future<void> saveOrderService(OrderServiceModel orderService);
  Future<List<OrderServiceModel>> fetchOrderServices();
  Future<void> sendOrderService(OrderServiceModel orderService);
}