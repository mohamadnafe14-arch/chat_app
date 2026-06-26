import 'package:chat_app/features/auth/data/repos/auth_repo.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chat_app/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> dependencyInjection() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  serviceLocator.registerFactory(() => FirebaseAuth.instance);
  serviceLocator.registerFactory<AuthRepo>(
    () => AuthRepoImpl(firebaseAuth: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(() => AuthCubit(serviceLocator()));
}
