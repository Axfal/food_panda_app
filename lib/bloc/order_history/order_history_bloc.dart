// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/order_history/order_history_model.dart';
import 'package:excellent_trade_app/repository/order/order_api_repository.dart';

import '../../service/web_socket_service/web_socket_service.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final OrderApiRepository orderApiRepository;
  final WebSocketService webSocketService;

  OrderHistoryBloc({
    required this.orderApiRepository,
    required this.webSocketService,
  }) : super(const OrderHistoryState()) {
    on<FetchOrdersHistoryEvent>(_onFetchCustomerOrderHistory);
    on<OrderStatusUpdatedEvent>(_onOrderStatusUpdated);

    // Listen to WebSocket
    webSocketService.onMessage = (data) {
      if (data['type'] == 'order_status_update') {
        add(OrderStatusUpdatedEvent(data['data']));
      }
    };
  }

  Future<void> _onFetchCustomerOrderHistory(
    FetchOrdersHistoryEvent event,
    Emitter<OrderHistoryState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {"customer_id": "2"}; // event.customerId};

    try {
      final response = await orderApiRepository.getCustomerOrderHistory(data);

      if (response != null) {
        if (response['success'] == true && response['orders'] != null) {
          final orderHistoryModel = OrderHistoryModel.fromJson(response);
          emit(
            state.copyWith(
              apiResponse: ApiResponse.completed("data fetched successfully"),
              orderHistoryModel: orderHistoryModel,
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? "Error while fetching data",
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server"),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(apiResponse: ApiResponse.error("Exception: $e")));
      print("error: $e");
    }
  }

  Future<void> _onOrderStatusUpdated(
    OrderStatusUpdatedEvent event,
    Emitter<OrderHistoryState> emit,
  ) async {
    final updateData = event.updateData;
    final customerId = updateData['customer_id']?.toString();
    final orderNumber = updateData['order_number'];

    final userId = SessionController.user.id.toString();
    if (customerId != "2"/*userId*/) return;

    final updatedOrders = state.orderHistoryModel.orders?.map((order) {
      if (order.orderNumber == orderNumber) {
        return Orders(
          id: order.id,
          orderNumber: order.orderNumber,
          customerId: order.customerId,
          restaurantId: order.restaurantId,
          deliveryBoyId: order.deliveryBoyId,
          status: updateData['status'] ?? order.status,
          trackingStatus: order.trackingStatus,
          totalAmount: order.totalAmount,
          discountAmount: order.discountAmount,
          finalAmount: order.finalAmount,
          paymentMethod: order.paymentMethod,
          paymentStatus: order.paymentStatus,
          specialInstructions: order.specialInstructions,
          createdAt: order.createdAt,
          updatedAt: updateData['updated_at'] ?? order.updatedAt,
          acceptedAt: order.acceptedAt,
          readyAt: order.readyAt,
          preparingAt: order.preparingAt,
          deliveryAcceptedAt: order.deliveryAcceptedAt,
          pickedUpAt: updateData['picked_up_at'] ?? order.pickedUpAt,
          deliveredAt: updateData['delivered_at'] ?? order.deliveredAt,
          canceledAt: updateData['canceled_at'] ?? order.canceledAt,
          failedAt: updateData['failed_at'] ?? order.failedAt,
          lastLocationUpdate: order.lastLocationUpdate,
          lat: order.lat,
          lng: order.lng,
          houseNo: order.houseNo,
          street: order.street,
          city: order.city,
          items: order.items,
        );
      }
      return order;
    }).toList();

    final updatedModel = OrderHistoryModel(
      success: state.orderHistoryModel.success,
      orders: updatedOrders,
      limit: state.orderHistoryModel.limit,
      offset: state.orderHistoryModel.offset,
    );

    emit(state.copyWith(orderHistoryModel: updatedModel));
  }
}
