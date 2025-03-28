import 'package:desafio_os/features/register_user/presentation/create_user_page/create_user_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class RegisterRoutes {
  const RegisterRoutes._();

  static const _base = '/register_route';
  static const registerRoute = '$_base/register';
}

final registerRoutes = [
  GoRoute(
    path: RegisterRoutes.registerRoute,
    builder: (context, state) {
      return CreateUserPage(
        controller: GetIt.instance.get(),
      );
    },
  ),
  
];
