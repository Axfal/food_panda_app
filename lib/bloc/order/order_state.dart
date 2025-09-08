part of 'order_bloc.dart';

class OrderState extends Equatable {
  final ApiResponse<String> apiResponse;
  final WebSocketOrder webSocketOrder;
  final List<OrderData> orders;
  final List<WebSocketOrder> vendorOrders;
  final int unreadOrders;

  OrderState({
    this.orders = const [],
    this.apiResponse = const ApiResponse.completed(''),
    WebSocketOrder? webSocketOrder,
    this.vendorOrders = const [],
    this.unreadOrders = 0,
  }) : webSocketOrder = webSocketOrder ?? WebSocketOrder.empty();

  OrderState copyWith({
    List<OrderData>? orders,
    ApiResponse<String>? apiResponse,
    WebSocketOrder? webSocketOrder,
    List<WebSocketOrder>? vendorOrders,
    int? unreadOrders,
  }) {
    return OrderState(
      orders: orders ?? this.orders,
      apiResponse: apiResponse ?? this.apiResponse,
      webSocketOrder: webSocketOrder ?? this.webSocketOrder,
      vendorOrders: vendorOrders ?? this.vendorOrders,
      unreadOrders: unreadOrders ?? this.unreadOrders,
    );
  }

  @override
  List<Object?> get props => [
    apiResponse,
    webSocketOrder,
    vendorOrders,
    unreadOrders,
    orders,
  ];
}
