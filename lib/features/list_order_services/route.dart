import 'package:desafio_os/features/register_order_services/presentation/create_order_service_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ListOrderServiceRoutes {
  const ListOrderServiceRoutes._();

  static const _base = '/order_service_route';
  static const listOrderServiceRoute = '$_base/list';
}

final orderServiceRoutes = [
  GoRoute(
    path: ListOrderServiceRoutes.listOrderServiceRoute,
    builder: (context, state) {
      return CreateOrderServicePage(
        controller: GetIt.instance.get(),
      );
    },
  ),
  
];