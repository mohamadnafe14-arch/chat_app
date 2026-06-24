import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:chat_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String initial = '/';
  static const String home = '/home';
  static final router = GoRouter(
    routes: [
      GoRoute(path: initial, builder: (context, state) => const SplashView()),
      GoRoute(path: home, builder: (context, state) => const HomeView()),
    ],
  );
}
