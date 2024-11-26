import 'dart:developer';

import 'package:e_commerce/core/error/excptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {

    Future deleteUser() async {
      await FirebaseAuth.instance.currentUser!.delete();
    }

  Future<User> createUserWithEmailAndPassword( String email, String password) async {
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
      log('Unexpected error occurred: ${e.toString()}');
      throw CustomException(message: "حدث خطأ ما، يرجى المحاولة مرة أخرى");
    }
  }
 Future<User> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
}
Future<User> signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance.login();

  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  return ( await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
}

}
