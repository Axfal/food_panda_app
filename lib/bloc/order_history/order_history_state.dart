part of 'order_history_bloc.dart';

class OrderHistoryState extends Equatable {
  final ApiResponse<String> apiResponse;
  final OrderHistoryModel orderHistoryModel;

  const OrderHistoryState({
    this.apiResponse = const ApiResponse.completed(''),
    this.orderHistoryModel = const OrderHistoryModel(),
  });

  OrderHistoryState copyWith({
    final ApiResponse<String>? apiResponse,
    final OrderHistoryModel? orderHistoryModel,
  }) {
    return OrderHistoryState(
      apiResponse: apiResponse ?? this.apiResponse,
      orderHistoryModel: orderHistoryModel ?? this.orderHistoryModel,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [apiResponse, orderHistoryModel];
}
