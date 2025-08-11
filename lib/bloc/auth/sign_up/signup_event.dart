part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class EmailChange extends SignupEvent {
  final String email;
  const EmailChange({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChange extends SignupEvent {
  final String passwordChange;
  const PasswordChange({required this.passwordChange});

  @override
  List<Object> get props => [passwordChange];
}

class ConfirmPasswordChange extends SignupEvent {
  final String confirmPasswordChange;
  const ConfirmPasswordChange({required this.confirmPasswordChange});

  @override
  List<Object> get props => [confirmPasswordChange];
}

class UserNameChange extends SignupEvent {
  final String userName;
  const UserNameChange({required this.userName});

  @override
  List<Object> get props => [userName];
}

class PhoneChange extends SignupEvent {
  final String phone;
  const PhoneChange({required this.phone});

  @override
  List<Object> get props => [phone];
}

class CountryCodeChange extends SignupEvent {
  final String countryCode;
  const CountryCodeChange({required this.countryCode});

  @override
  List<Object> get props => [countryCode];
}

class RoleChange extends SignupEvent {
  final String role;
  const RoleChange({required this.role});

  @override
  // TODO: implement props
  List<Object> get props => [role];
}

class SignupApi extends SignupEvent {
  const SignupApi();

  @override
  List<Object> get props => [];
}
