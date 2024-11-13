import 'package:e_commerce/core/error/excptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(  String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: " كلمة المرور ضعيفة") ;
       } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: "البريد الالكترونى موجود مسبقا") ; 
      }
      else{
      throw CustomException(message:"حدث خطأ ما , يرجى المحاولة مرة اخرى" ) ;

      }
    } catch (e) {
      throw CustomException(message:"حدث خطأ ما , يرجى المحاولة مرة اخرى" ) ;
    }
  }
}
