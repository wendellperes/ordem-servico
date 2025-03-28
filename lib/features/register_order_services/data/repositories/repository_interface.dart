import 'package:desafio_os/features/register_order_services/data/models/order_service_model.dart';

abstract class IOrderServiceRepository {
  Future<bool> saveOrderService({
    required String title,
    required String description,
    required String checklistOption,
    required String photoPath,
  });
  Future<List<OrderServiceModel>> fetchOrderServices();
  Future<void> sendOrderService(OrderServiceModel orderService);
}