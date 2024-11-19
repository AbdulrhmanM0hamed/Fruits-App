import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';

class FirestoreService implements DatabaseService {
  final db = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
     await db.collection("users").add(data);
  }
  
  @override
  Future<UserEntity> getUserData({required String path, required String uid}) async {
   var data =  await db.collection(path).doc(uid).get()  ;
   return UserModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
