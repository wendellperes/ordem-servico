import 'package:desafio_os/features/list_order_services/data/repositories/repository_interface.dart';
import 'package:desafio_os/features/list_order_services/data/datasources/local/local_data_source_interface.dart';
import 'package:desafio_os/features/list_order_services/data/models/order_service_model.dart';

class ListOrderServiceRepository implements IListOrderServiceRepository {
  final IListOrderServiceLocalDataSource localDataSource;

  ListOrderServiceRepository({
    required this.localDataSource,
  });

  @override
  Future<List<OrderServiceModel>> fetchOrderServices() async {
    return await localDataSource.fetchOrderServices();
  }
}
