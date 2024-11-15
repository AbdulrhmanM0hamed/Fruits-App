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
      log('FirebaseAuthException occurred: ${e.code} - ${e.message}');
      
      if (e.code == 'weak-password') {
        throw CustomException(message: "كلمة المرور ضعيفة");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: "البريد الالكترونى موجود مسبقاً");
      }
      else if (e.code == 'network-request-failed') {
        throw CustomException(message: "لا يوجد اتصال بالانترنت");
      }
       else {
        throw CustomException(message: "حدث خطأ ما، يرجى المحاولة مرة أخرى");
      }
    } catch (e) {
      // تسجيل أي أخطاء عامة
      log('FirebaseAuth.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(message: "حدث خطأ ما، يرجى المحاولة مرة أخرى");
    }
  }


  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // تسجيل الأخطاء بمزيد من التفصيل
      log('FirebaseAuthException occurred: ${e.code} - ${e.message}');

      if (e.code == 'user-not-found') {
        throw CustomException(message: "البريد الالكترونى غير موجود");
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: " البريد الالكترونى أو كلمة المرور غير صحيح");
      } 
       else if (e.code == 'network-request-failed') {
        throw CustomException(message: "لا يوجد اتصال بالانترنت");
      }
      else {
        throw CustomException(message: "حدث خطأ ما، يرجى المحاولة مرة أخرى");
      }
    } catch (e) {
      // تسجيل أي أخطاء عامة
      log('Unexpected error occurred: ${e.toString()}');
      throw CustomException(message: "حدث خطأ ما، يرجى المحاولة مرة أخرى");
    }
  }
}
