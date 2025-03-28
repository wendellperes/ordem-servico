import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:desafio_os/features/login/presentation/login_page/login_page.dart';

class LoginRoutes {
  const LoginRoutes._();

  static const _base = '/initial';
  static const loginRoute = '$_base/login';

}

final loginRoutes = [
  GoRoute(
    path: LoginRoutes.loginRoute,
    builder: (context, state) {
      return LoginPage(
        controller: GetIt.instance.get(),
      );
    },
  ),
  
];
