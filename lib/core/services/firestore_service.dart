import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';

class FirestoreService implements DatabaseService {
  final db = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data , String? documentId }) async {

        if(documentId != null){
          await db.collection(path).doc(documentId).set(data);
         
        }
        else{ 
          await db.collection(path).add(data);
        }
   
  }
  
  @override
  Future<Map<String , dynamic>> getData({required String path, required String documentId}) async {
   var data =  await db.collection(path).doc(documentId).get()  ;
   return data.data() as Map<String, dynamic  > ;
}
}
