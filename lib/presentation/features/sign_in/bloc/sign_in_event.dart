part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInInit extends SignInEvent {}

class OnTapButtonLogin extends SignInEvent {
  final String email;
  final String password;

  OnTapButtonLogin({required this.email, required this.password});
}
