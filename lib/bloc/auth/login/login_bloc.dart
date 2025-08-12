import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';

import '../../../model/login/login_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  AuthApiRepository authApiRepository;

  LoginBloc({required this.authApiRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_onFormSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onFormSubmitted(LoginApi event, Emitter<LoginStates> emit) async {
    Map<String, String> data = {
      'email': state.email,
      'password': state.password,
    };

    emit(state.copyWith(loginApi: const ApiResponse.loading()));

    try {
      final response = await authApiRepository.loginApi(data);

      if (response is Map<String, dynamic>) {
        // Parse response JSON into LoginModel
        final loginModel = LoginModel.fromJson(response);

        if (loginModel.success) {
          if (loginModel.user != null) {
            await SessionController().saveUserInPreference(loginModel.user!);
            await SessionController().getUserFromPreference();
          }

          emit(state.copyWith(
            loginApi: ApiResponse.completed(loginModel.message),
          ));
        } else {
          String errorMessage = 'Login failed';

          if (loginModel.message.isNotEmpty) {
            errorMessage = loginModel.message;
          } else if (response.containsKey('error') &&
              response['error'] is String &&
              (response['error'] as String).isNotEmpty) {
            errorMessage = response['error'];
          } else if (response.containsKey('message') &&
              response['message'] is String &&
              (response['message'] as String).isNotEmpty) {
            errorMessage = response['message'];
          }

          emit(state.copyWith(
            loginApi: ApiResponse.error(errorMessage),
          ));
        }
      } else {
        emit(state.copyWith(
          loginApi: ApiResponse.error('No response from server'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(loginApi: ApiResponse.error(error.toString())));
    }
  }

}
