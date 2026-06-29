import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/core/services/firebase_firestore_service.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chat_app/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> dependencyInjection() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Firebase Instances
  serviceLocator.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  serviceLocator.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Services
  serviceLocator.registerLazySingleton(
    () => FirebaseAuthService(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => FirebaseFirestoreService(serviceLocator()),
  );

  // Repositories
  serviceLocator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      serviceLocator<FirebaseAuthService>(),
      serviceLocator<FirebaseFirestoreService>(),
    ),
  );

  // Cubits
  serviceLocator.registerFactory(() => AuthCubit(serviceLocator()));
}
