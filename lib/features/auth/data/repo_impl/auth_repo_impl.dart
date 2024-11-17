import 'dart:developer'; // لاستيراد الدالة log
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/excptions.dart';
import 'package:e_commerce/core/error/sevcice_failure.dart';
import 'package:e_commerce/core/services/firebase_auth_sevice.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email, password);
      return right(UserModel.fromfirebaseUSer(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log('createUserWithEmailAndPassword: $e');
      return left(ServerFailure(errMessage: e.toString()));
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
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromfirebaseUSer(user));
    }  catch (e) {
      log('signInWithGoogle: $e');
      return left(ServerFailure(errMessage: 'حدث خطأ ما'));
    }

    
  }
  
  @override
  Future<Either<Failuer, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromfirebaseUSer(user));
    }  catch (e) {
      log('signInWithFacebook: $e');
      return left(ServerFailure(errMessage: 'حدث خطأ ما'));
    }
    
}}
