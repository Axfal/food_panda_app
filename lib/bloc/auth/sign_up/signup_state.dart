part of 'signup_bloc.dart';

class SignupStates extends Equatable {
  final String userName;
  final String email;
  final String phone;
  final String countryCode;
  final String password;
  final String confirmPassword;
  final String role;
  final ApiResponse<String> signupApi;

  const SignupStates({
    this.email = '',
    this.confirmPassword = '',
    this.userName = '',
    this.password = '',
    this.phone = '',
    this.countryCode = '',
    this.role = '',
    this.signupApi = const ApiResponse.completed(''),
  });

  SignupStates copyWith({
    String? email,
    String? userName,
    String? confirmPassword,
    String? password,
    String? phone,
    String? countryCode,
    String? role,
    ApiResponse<String>? signupApi,
  }) {
    return SignupStates(
      email: email ?? this.email,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      role: role ?? this.role,
      signupApi: signupApi ?? this.signupApi,
    );
  }

  @override
  // TODO: implement props
  @override
  List<Object?> get props => [
    userName,
    email,
    phone,
    countryCode,
    password,
    confirmPassword,
    role,
    signupApi
  ];

}
