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
    on<SignupApi>(_onFormSubmitted);
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
      'device_id': '1234-5678',
      'referral_code': 'REF123',
    };
    emit(state.copyWith(signupApi: const ApiResponse.loading()));
    await authApiRepository
        .signupApi(data)
        .then((value) async {
          if (value.error.isNotEmpty) {
            emit(state.copyWith(signupApi: ApiResponse.error(value.error)));
          } else {
            emit(
              state.copyWith(
                signupApi: const ApiResponse.completed('SignUp Successfully'),
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(signupApi: ApiResponse.error(error.toString())));
        });
  }
}
