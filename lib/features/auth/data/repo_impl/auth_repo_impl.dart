import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/excptions.dart';
import 'package:e_commerce/core/error/sevcice_failure.dart';
import 'package:e_commerce/core/services/firebase_auth_sevice.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
  String name ,  String email, String password) async {
  try {
  var user =    await firebaseAuthService.createUserWithEmailAndPassword( email, password);
  
  return right(UserModel.fromfirebaseUSer(user)) ;
} on CustomException catch (e) {
  
  return left(ServerFailure(errMessage: e.message));
} catch(e){
  return left(ServerFailure(errMessage: e.toString()));

}
       
  }
}
