part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final String email;
  final String pinCode;
  final ApiResponse<String> signinOtp;
  final ApiResponse<String> verifyOtp;

  const ForgotPasswordState({
    this.email = '',
    this.pinCode = '',
    this.verifyOtp = const ApiResponse.completed(''),
    this.signinOtp = const ApiResponse.completed(''),
  });

  ForgotPasswordState copyWith({
    String? email,
    String? pinCode,
    ApiResponse<String>? signinOtp,
    ApiResponse<String>? verifyOtp,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      verifyOtp: verifyOtp ?? this.verifyOtp,
      signinOtp: signinOtp ?? this.signinOtp,
      pinCode: pinCode ?? this.pinCode,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, pinCode, verifyOtp, signinOtp];
}
