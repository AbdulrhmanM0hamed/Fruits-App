import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo  authRepo ;
  
  Future<void> createUserWithEmailAndPassword(String name, String email, String password) async {
    emit(SignUpLoadingState());
    final result = await authRepo.createUserWithEmailAndPassword(name, email, password);
    result.fold(
      (failure) => emit(SignUpFailureState(errorMessage: failure.errMessage)),
      (userEntity) => emit(SignUpSuccesState(userEntity: userEntity)),
    );
  }

}
