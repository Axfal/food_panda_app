part of 'signup_bloc.dart';

class SignupStates extends Equatable {
  final String userName;
  final String email;
  final String phone;
  final String countryCode;
  final String password;
  final String confirmPassword;
  final ApiResponse<String> signupApi;

  const SignupStates({
    this.email = '',
    this.confirmPassword = '',
    this.userName = '',
    this.password = '',
    this.phone = '',
    this.countryCode = '',
    this.signupApi = const ApiResponse.completed(''),
  });

  SignupStates copyWith({
    String? email,
    String? userName,
    String? confirmPassword,
    String? password,
    String? phone,
    String? countryCode,
    ApiResponse<String>? signupApi,
  }) {
    return SignupStates(
      email: email ?? this.email,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      signupApi: signupApi ?? this.signupApi,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    userName,
    email,
    phone,
    countryCode,
    password,
    confirmPassword,
  ];
}
