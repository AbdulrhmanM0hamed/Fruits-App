part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoadingState extends SignUpState {}
final class SignUpSuccesState extends SignUpState {

 final UserEntity userEntity;
 SignUpSuccesState({required this.userEntity});
}
final class SignUpFailureState extends SignUpState {
  final String errorMessage;
  SignUpFailureState({required this.errorMessage});
}


