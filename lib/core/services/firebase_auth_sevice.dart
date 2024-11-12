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
        throw CustomException(message: " the password provided is too weak") ;
       } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: "the account already exists for that email") ; 
      }
      else{
      throw CustomException(message:"An error occurred,please try later " ) ;

      }
    } catch (e) {
      throw CustomException(message:"An error occurred,please try later " ) ;
    }
  }
}
