import 'dart:developer'; // لاستيراد الدالة log
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/excptions.dart';
import 'package:e_commerce/core/error/sevcice_failure.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/services/firebase_auth_sevice.dart';
import 'package:e_commerce/core/utils/constants/backEnd_Endpoint.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

 final DatabaseService databaseService;

  AuthRepoImpl(this.databaseService, {required this.firebaseAuthService});

  @override
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
      String name, String email, String password) async {
       User? user ; 
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email, password);
          var userEntity = UserEntity(
            email: email,
            name: name,
            id: user.uid,
          );
          addUserData(userEntity: userEntity) ;
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log('createUserWithEmailAndPassword: $e');
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  Future<void> deleteUser(User? user) async {
      if (user != null)  {
      await firebaseAuthService.deleteUser();
      
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signInWithEmailAndPassword(email, password);
      return right(UserModel.fromfirebaseUSer(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log('signInWithEmailAndPassword: $e');
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Failuer, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromfirebaseUSer(user);
      addUserData(userEntity: userEntity);
      return right(UserModel.fromfirebaseUSer(user));
    }  catch (e) {
      await deleteUser(user);
      log('signInWithGoogle: $e');
      return left(ServerFailure(errMessage: 'حدث خطأ ما'));
    }

    
  }
  
  @override
  Future<Either<Failuer, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithFacebook();
        var userEntity = UserModel.fromfirebaseUSer(user);
      addUserData(userEntity: userEntity);
      return right(UserModel.fromfirebaseUSer(user));
    }  catch (e) {
      await deleteUser(user);
      log('signInWithFacebook: $e');
      return left(ServerFailure(errMessage: 'حدث خطأ ما'));
    }
    
}

  @override
  Future addUserData({required UserEntity userEntity}) async {
   await databaseService.addData(path: BackendEndpoint.users,data: userEntity.toMap());
  }
  
  }
