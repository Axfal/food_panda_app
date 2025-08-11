import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupStates> {
  AuthApiRepository authApiRepository;
  SignupBloc({required this.authApiRepository}) : super(SignupStates()) {
    on<EmailChange>(_onEmailChanged);
    on<UserNameChange>(_onUserNameChanged);
    on<PasswordChange>(_onPasswordChanged);
    on<ConfirmPasswordChange>(_onConfirmPasswordChanged);
    on<PhoneChange>(_phoneChange);
    on<CountryCodeChange>(_onCountryCodeChange);
    on<RoleChange>(_onRoleChange);
    on<SignupApi>(_onFormSubmitted);
  }

  void _onRoleChange(RoleChange event, Emitter<SignupStates> emit) {
    emit(state.copyWith(role: event.role));
  }

  void _onEmailChanged(EmailChange event, Emitter<SignupStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onUserNameChanged(UserNameChange event, Emitter<SignupStates> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _onPasswordChanged(PasswordChange event, Emitter<SignupStates> emit) {
    emit(state.copyWith(password: event.passwordChange));
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChange event,
    Emitter<SignupStates> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.confirmPasswordChange));
  }

  void _onCountryCodeChange(
    CountryCodeChange event,
    Emitter<SignupStates> emit,
  ) {
    emit(state.copyWith(countryCode: event.countryCode));
  }

  void _phoneChange(PhoneChange event, Emitter<SignupStates> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  void _onFormSubmitted(SignupApi event, Emitter<SignupStates> emit) async {
    Map<String, dynamic> data = {
      'user_name': state.userName,
      'email': state.email,
      'phone': state.phone,
      'country_code': state.countryCode,
      'password': state.password,
      'confirm_password': state.confirmPassword,
      'role': state.role,
      'device_id': '1234-5678',
      'referral_code': 'REF123',
    };

    emit(state.copyWith(signupApi: const ApiResponse.loading()));

    await authApiRepository.signupApi(data).then((value) async {
      // Make sure value is a Map<String, dynamic>
      if (value is Map<String, dynamic>) {
        if (value.containsKey('error') && value['error'].toString().isNotEmpty) {
          emit(state.copyWith(
            signupApi: ApiResponse.error(value['error'].toString()),
          ));
        } else if (value.containsKey('success') &&
            value['success'].toString().isNotEmpty) {
          emit(state.copyWith(
            signupApi: ApiResponse.completed(value['success'].toString()),
          ));
        } else {
          emit(state.copyWith(
            signupApi: const ApiResponse.error("Unknown response from server"),
          ));
        }
      } else {
        emit(state.copyWith(
          signupApi: const ApiResponse.error("Invalid API response format"),
        ));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(signupApi: ApiResponse.error(error.toString())));
    });
  }

}
