import 'package:desafio_os/features/home/presentation/home/home_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomeRoutes {
  const HomeRoutes._();

  static const _base = '/home';
  static const homeRoute = '$_base/initial';
}

final homeRoutes = [
  GoRoute(
    path: HomeRoutes.homeRoute,
    builder: (context, state) {
      return HomePage(
        controller: GetIt.instance.get(),
      );
    },
  ),
  
];
