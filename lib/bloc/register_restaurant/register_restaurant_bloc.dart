import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

import '../../data/response/api_response.dart';
part 'register_restaurant_event.dart';
part 'register_restaurant_state.dart';

class RegisterRestaurantBloc extends Bloc<RegisterRestaurantEvent, RegisterRestaurantStates> {
  RegisterRestaurantBloc() : super(RegisterRestaurantStates()) {
    on<RegisterRestaurantEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  _on
}
