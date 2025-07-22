part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
  @override
  List<Object> get props => [];
}

class EmailChange extends ForgotPasswordEvent {
  final String email;
  const EmailChange({required this.email});
  @override
  List<Object> get props => [email];
}

class PinCodeChange extends ForgotPasswordEvent {
  final String pinCode;
  const PinCodeChange({required this.pinCode});
  @override
  List<Object> get props => [];
}

class SigninOtp extends ForgotPasswordEvent {
  const SigninOtp();
}

class VerifyOtp extends ForgotPasswordEvent {
  const VerifyOtp();
}
