import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  final db = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
     await db.collection("users").add(data);
  }
}
