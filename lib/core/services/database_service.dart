
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  
  Future<void> addData(
      {required String path, required Map<String, dynamic> data , String? documentId}) async {
   
  }
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) ;
}
