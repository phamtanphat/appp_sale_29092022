part of 'sign_in_bloc.dart';

// thay SignIn = tên màn hình
// loading
enum SignInStatus { init, loading, loaded, success }

class SignInState {
  final SignInStatus status;
  final String message;
  //final bool enableShowPassword; // <---

  const SignInState({
    this.status = SignInStatus.init,
    this.message = '',
    //this.enableShowPassword = false, // <---
  });

  SignInState copyWith({
    SignInStatus? status,
    String? message,
    // bool? enableShowPassword, // <---
  }) {
    return SignInState(
      status: status ?? this.status,
      message: message ?? this.message,
      // enableShowPassword: enableShowPassword ?? this.enableShowPassword, // <---
    );
  }
}
