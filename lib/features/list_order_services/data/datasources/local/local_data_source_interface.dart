import 'package:desafio_os/features/list_order_services/data/models/order_service_model.dart';

abstract class IListOrderServiceLocalDataSource {
  Future<List<OrderServiceModel>> fetchOrderServices();
}