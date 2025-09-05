part of 'order_bloc.dart';

class OrderState extends Equatable {
  final ApiResponse<String> apiResponse;
  const OrderState({this.apiResponse = const ApiResponse.completed('')});

  OrderState copyWith({final ApiResponse<String>? apiResponse}) {
    return OrderState(apiResponse: apiResponse ?? this.apiResponse);
  }

  @override
  List<Object?> get props => [apiResponse];
}
