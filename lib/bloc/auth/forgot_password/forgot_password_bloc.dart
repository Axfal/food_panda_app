// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excellent_trade_app/data/response/api_response.dart';
import 'package:excellent_trade_app/repository/auth/auth_api_repository.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  AuthApiRepository authApiRepository;
  ForgotPasswordBloc({required this.authApiRepository})
    : super(ForgotPasswordState()) {
    on<EmailChange>(_onEmailChange);
    on<PinCodeChange>(_onPinCodeChange);
    on<SigninOtp>(_onSignInOtp);
    on<VerifyOtp>(_onVerifyOtp);
  }
  void _onEmailChange(EmailChange event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPinCodeChange(
    PinCodeChange event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(pinCode: event.pinCode));
  }

  void _onSignInOtp(SigninOtp event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(signinOtp: ApiResponse.loading()));

    Map<String, dynamic> data = {'email': state.email};
    dynamic response = await authApiRepository.sigInOTP(data);

    if (response != null) {
      if (response['success'] != null && response['success'] == "OTP sent to email") {
        print("okkkkkaksdkasd");
        emit(
          state.copyWith(
            signinOtp: ApiResponse.completed(response['success'].toString()),
          ),
        );
      } else {
        final errorMessage = response['error']?.toString() ?? 'Unknown error occurred';
        emit(state.copyWith(signinOtp: ApiResponse.error(errorMessage)));
      }
    } else {
      emit(state.copyWith(signinOtp: ApiResponse.error("No response from server")));
    }
  }

  void _onVerifyOtp(VerifyOtp event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(verifyOtp: ApiResponse.loading()));
    Map<String, dynamic> data = {'email': state.email, 'otp': state.pinCode};
    await authApiRepository
        .verifyOTP(data)
        .then((value) async {
          if (value.error.isNotEmpty) {
            emit(
              state.copyWith(verifyOtp: ApiResponse.error(value.toString())),
            );
          } else {
            emit(
              state.copyWith(
                verifyOtp: ApiResponse.completed("SignIn Successfully"),
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(verifyOtp: ApiResponse.error(error.toString())));
        });
  }
}
