import 'dart:developer'; // لاستيراد log
import 'package:e_commerce/core/error/excptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // تسجيل الأخطاء بمزيد من التفصيل
      log('FirebaseAuthException occurred: ${e.code} - ${e.message}');
      
      if (e.code == 'weak-password') {
        throw CustomException(message: "كلمة المرور ضعيفة");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: "البريد الالكترونى موجود مسبقاً");
      } else {
        throw CustomException(message: "حدث خطأ ما، يرجى المحاولة مرة أخرى");
      }
    } catch (e) {
      // تسجيل أي أخطاء عامة
      log('FirebaseAuth.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: "حدث خطأ ما، يرجى المحاولة مرة أخرى");
    }
  }
}
