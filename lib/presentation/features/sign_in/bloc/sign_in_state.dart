part of 'sign_in_bloc.dart';

enum SignInStatus { init, loading, loaded, success }

class SignInState {
  final SignInStatus status;
  final String message;

  const SignInState({
    this.status = SignInStatus.init,
    this.message = '',
  });

  SignInState copyWith({
    SignInStatus? status,
    String? message,
  }) {
    return SignInState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
