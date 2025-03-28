import 'package:desafio_os/features/register_order_services/presentation/create_order_service_page.dart';
import 'package:desafio_os/features/register_order_services/presentation/take_photo_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class OrderServiceRoutes {
  const OrderServiceRoutes._();

  static const _base = '/order_service_route';
  static const createOrderServiceRoute = '$_base/create';
  static const takePhotoRoute = '$_base/take_photo';
}

final orderServiceRoutes = [
  GoRoute(
    path: OrderServiceRoutes.createOrderServiceRoute,
    builder: (context, state) {
      return CreateOrderServicePage(
        controller: GetIt.instance.get(),
      );
    },
  ),
  GoRoute(
    path: OrderServiceRoutes.takePhotoRoute,
    builder: (context, state) {
      return TakePhotoPage(
      );
    },
  ),
];