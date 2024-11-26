import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/excptions.dart';
import 'package:e_commerce/core/error/sevcice_failure.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/services/firebase_auth_sevice.dart';
import 'package:e_commerce/core/services/shared_preferences.dart';
import 'package:e_commerce/core/utils/constants/backEnd_Endpoint.dart';
import 'package:e_commerce/core/utils/constants/constants.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  final DatabaseService databaseService;

  AuthRepoImpl(this.databaseService, {required this.firebaseAuthService});

  @override
@override
Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
    String name, String email, String password) async {
  User? user;
  try {
    user = await firebaseAuthService.createUserWithEmailAndPassword(email, password);
    var userEntity = UserEntity(
      email: email,
      name: name,
      id: user.uid,
    );

    var isUserExist = await databaseService.isUserExist(
        path: BackendEndpoint.users, documentId: user.uid);
    

    if (!isUserExist) {
      await addUserData(userEntity: userEntity);
    }
    var fetchedUser = await getUserData(userId: user.uid);
     await saveUserData(user: userEntity);
     return right(fetchedUser);
    

  } on CustomException catch (e) {
    await deleteUser(user); 
    return left(ServerFailure(errMessage: e.message));
  } catch (e) {
    log('createUserWithEmailAndPassword: $e');
    return left(ServerFailure(errMessage: e.toString()));
  }
}


  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
           email, password);
      var userEntity = await getUserData(userId:  user.uid);
      await saveUserData(user: userEntity);
      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure( errMessage: 
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }
  @override
  Future<Either<Failuer, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromfirebaseUSer(user);
      var isUserExist = await databaseService.isUserExist(path: BackendEndpoint.users, documentId: user.uid);
      if (!isUserExist) {
        await addUserData(userEntity: userEntity);
      }else{
        await getUserData(userId: user.uid);
      }
      
      return right(UserModel.fromfirebaseUSer(user));
    } catch (e) {
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
      var isUserExist = await databaseService.isUserExist(path: BackendEndpoint.users, documentId: user.uid);
      if (!isUserExist) {
        await addUserData(userEntity: userEntity);
      }else{
        await getUserData(userId: user.uid);
      }
      return right(UserModel.fromfirebaseUSer(user));
    } catch (e) {
      await deleteUser(user);
      log('signInWithFacebook: $e');
      return left(ServerFailure(errMessage: 'حدث خطأ ما'));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {

    await databaseService.addData(
        path: BackendEndpoint.users, data: UserModel.fromEntity(userEntity).toMap(), documentId: userEntity.id);
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    final getdata = await databaseService.getData(
        path: BackendEndpoint.getusers, documentId: userId);

    return UserModel.fromJson(getdata);
  }
  
  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(KUserData, jsonData);
  }
  

}
