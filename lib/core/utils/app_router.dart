import 'package:chat_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String initial = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(path: initial, builder: (context, state) => const SplashView()),
    ],
  );
}
