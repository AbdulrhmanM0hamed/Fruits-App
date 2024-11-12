import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/sevcice_failure.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';

 abstract class AuthRepo {


  Future<Either<Failuer , UserEntity>> createUserWithEmailAndPassword(String name, String email, String password) ;
  
}