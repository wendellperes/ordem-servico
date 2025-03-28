import 'package:desafio_os/features/home/router.dart';
import 'package:desafio_os/features/login/presentation/login_page/login_page.dart';
import 'package:desafio_os/features/login/presentation/router.dart';
import 'package:desafio_os/features/register_order_services/presentation/create_order_service_page.dart';
import 'package:desafio_os/features/register_order_services/route.dart';
import 'package:desafio_os/features/register_user/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

const initialRoute = '/';

final appRouter = GoRouter(
  debugLogDiagnostics: !kReleaseMode,
  initialLocation: initialRoute,
  routes: [
    GoRoute(
      path: initialRoute,
      name: 'login',
      builder: (context, state) {
        return CreateOrderServicePage(
          controller: GetIt.instance.get(),
        );
      },
    ),
    ...loginRoutes,
    ...registerRoutes,
    ...homeRoutes,
    ...orderServiceRoutes,
  ],
);
