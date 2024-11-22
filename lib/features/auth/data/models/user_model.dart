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
  
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      id: user.id,
    );
  }

    toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
    );
  }
 }