import 'package:chat_app/features/auth/presentation/views/login_view.dart';
import 'package:chat_app/features/auth/presentation/views/regsiter_view.dart';
import 'package:chat_app/features/auth/presentation/views/wrapper_view.dart';
import 'package:chat_app/features/home/presentation/views/chat_view.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:chat_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String initial = '/';
  static const String home = '/home';
  static const String register = '/register';
  static const String login = '/login';
  static const String wrapper = '/wrapper';
  static const String chat = '/chat';
  static final router = GoRouter(
    routes: [
      GoRoute(path: initial, builder: (context, state) => const SplashView()),
      GoRoute(path: home, builder: (context, state) => const HomeView()),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(path: login, builder: (context, state) => const LoginView()),
      GoRoute(path: wrapper, builder: (context, state) => const WrapperView()),
      GoRoute(path: chat, builder: (context, state) => const ChatView()),
    ],
  );
}
