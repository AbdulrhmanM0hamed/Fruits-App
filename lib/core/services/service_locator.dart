import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/services/firebase_auth_sevice.dart';
import 'package:e_commerce/core/services/firestore_service.dart';
import 'package:e_commerce/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/view/controller/signin_cubit/sign_in_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/controller/signup_cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Auth

  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  sl.registerLazySingleton<DatabaseService>(() => FirestoreService());


// تسجيل AuthRepoImpl باستخدام FirebaseAuthService
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      sl(),
      firebaseAuthService: sl(),
      
      
    ),
  );

// تسجيل SignUpCubit باستخدام AuthRepo
  sl.registerLazySingleton<SignUpCubit>(
    () => SignUpCubit(sl()),
  );

  sl.registerLazySingleton<SignInCubit>(
    () => SignInCubit(sl()),
  );

  // getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // getIt.registerSingleton<AuthRepo>(
  //   AuthRepoImpl(
  //     firebaseAuthService: getIt<FirebaseAuthService>(),
  //   ),
  // );

  // getIt.registerLazySingleton(() => AuthRepoImpl(firebaseAuthService: getIt()));

  // getIt.registerLazySingleton(() => FirebaseAuthService() );

  // getIt.registerLazySingleton(() => SignUpCubit(getIt()));
}
