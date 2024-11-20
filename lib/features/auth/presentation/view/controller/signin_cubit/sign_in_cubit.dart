import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

 final AuthRepo authRepo;
    
   Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInloadingState());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignInErrorState(errorMessage: failure.errMessage)),
      (user) => emit(SignInSuccessState(user: user)),
    );
  }

 Future<void> signInWithGoogle() async {
    emit(SignInloadingState());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInErrorState(errorMessage: failure.errMessage)),
      (user) => emit(SignInSuccessState(user: user)),
    );
  }
  Future<void>signInWithFacebook() async {
    emit(SignInloadingState());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SignInErrorState(errorMessage: failure.errMessage)),
      (user) => emit(SignInSuccessState(user: user)),
    );
  }

    
}

