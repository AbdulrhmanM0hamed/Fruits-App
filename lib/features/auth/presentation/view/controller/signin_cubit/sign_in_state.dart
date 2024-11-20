part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class SignInloadingState extends SignInState {}
final class SignInSuccessState extends SignInState {
  final UserEntity user;
  SignInSuccessState({required this.user});
}
final class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState({required this.errorMessage});
}



