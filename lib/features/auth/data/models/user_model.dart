import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.email,});


  factory UserModel.fromfirebaseUSer(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      id: user.uid    
    ) ;
  }
 }