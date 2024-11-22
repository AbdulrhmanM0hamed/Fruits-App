import 'dart:convert';

import 'package:e_commerce/core/services/shared_preferences.dart';
import 'package:e_commerce/core/utils/constants/constants.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';

UserEntity getUserData() {
  var jsonString = Prefs.getString(KUserData);


  var userEntity = UserModel.fromJson(jsonDecode(jsonString!));
  return userEntity;
}
