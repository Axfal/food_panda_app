// ignore_for_file: avoid_print

import 'package:excellent_trade_app/repository/order/order_api_repository.dart';
import '../../config/routes/route_export.dart';
import '../../model/delivery_address/order_request_model.dart';
import '../../model/vender/order/order_model.dart' hide OrderItem;
import '../../service/sound_service/notification_sound_service.dart';
import '../../service/web_socket_service/web_socket_service.dart';
import '../../model/web_socket_order/web_socket_order_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderApiRepository orderApiRepository;
  final WebSocketService webSocketService;

  OrderBloc({required this.orderApiRepository, required this.webSocketService})
    : super(OrderState()) {
    on<CheckOutEvent>(_onCheckout);

    on<NewOrderReceivedEvent>(_onNewOrderReceived);

    on<FetchOrderEvent>(_onGetOrders);

    on<StatusUpdateEvent>(_onUpdateStatus);

    webSocketService.onMessage = (data) {
      print(data);

      if (data['type'] == 'new_order') {
        try {
          final orderJson = data['data'] as Map<String, dynamic>;
          final order = WebSocketOrder.fromJson(orderJson);

          print("New WebSocket order received: ${order.orderNumber}");
          add(NewOrderReceivedEvent(order));
        } catch (e) {
          print("Error parsing WebSocketOrder: $e");
        }
      }
    };
  }

  Future<void> _onUpdateStatus(
    StatusUpdateEvent event,
    Emitter<OrderState> emit,
  ) async {
    // emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {
      "order_number": event.orderNumber,
      "restaurant_id": event.restaurantId,
      "status": event.status,
    };

    try {
      final response = await orderApiRepository.updateStatus(data);

      if (response != null &&
          response['success'] == true &&
          response['order'] != null) {
        final updatedOrder = OrderData.fromJson(response['order']);

        final updatedOrders = state.orders.map((order) {
          if (order.orderNumber == updatedOrder.orderNumber) {
            return order.copyWith(status: updatedOrder.status);
          }
          return order;
        }).toList();

        final updatedVendorOrders = state.vendorOrders.map((order) {
          if (order.orderNumber == updatedOrder.orderNumber) {
            return WebSocketOrder(
              orderId: order.orderId,
              orderNumber: order.orderNumber,
              customerId: order.customerId,
              restaurantId: order.restaurantId,
              items: order.items,
              totalAmount: order.totalAmount,
              finalAmount: order.finalAmount,
              lat: order.lat,
              lng: order.lng,
              houseNo: order.houseNo,
              street: order.street,
              city: order.city,
            );
          }
          return order;
        }).toList();

        webSocketService.sendMessage({
          "type": "order_status_update",
          "order_number": updatedOrder.orderNumber,
          "restaurant_id": updatedOrder.restaurantId,
          "status": updatedOrder.status,
        });

        emit(
          state.copyWith(
            orders: updatedOrders,
            vendorOrders: updatedVendorOrders,
            apiResponse: const ApiResponse.completed(
              "Order status updated successfully.",
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error(
              response?['message'] ?? 'Failed to update status',
            ),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(apiResponse: ApiResponse.error("Error: $e")));
    }
  }

  Future<void> _onGetOrders(
    FetchOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {
      "restaurant_id": event.restaurantId,
      "limit": event.limit,
      "offset": event.offset,
    };

    try {
      final response = await orderApiRepository.getOrders(data);

      if (response != null) {
        final orderModel = OrderModel.fromJson(response);

        if (orderModel.success && orderModel.orders.isNotEmpty) {
          emit(
            state.copyWith(
              orders: orderModel.orders,
              apiResponse: const ApiResponse.completed(
                "Orders fetched successfully",
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(apiResponse: ApiResponse.error('No orders found')),
          );
        }
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error('No response from server'),
          ),
        );
      }
    } catch (e) {
      print('error: $e');
      emit(state.copyWith(apiResponse: ApiResponse.error('Error: $e')));
    }
  }

  Future<void> _onNewOrderReceived(
    NewOrderReceivedEvent event,
    Emitter<OrderState> emit,
  ) async {
    final order = event.orderData;

    final updatedOrders = List<WebSocketOrder>.from(state.vendorOrders)
      ..add(order);

    emit(
      state.copyWith(
        vendorOrders: updatedOrders,
        webSocketOrder: order,
        unreadOrders: state.unreadOrders + 1,
      ),
    );
    NotificationSound.playNotification();

    print("Total orders: ${updatedOrders.length}");
    print("Latest order number: ${order.orderNumber}");
  }

  Future<void> _onCheckout(
    CheckOutEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    try {
      Map<String, dynamic> data = {
        "customer_id": event.customerId,
        "restaurant_id": event.restaurantId,
        "total_amount": event.totalAmount,
        "discount_amount": event.discountAmount,
        "final_amount": event.finalAmount,
        "payment_method": event.paymentMethod,
        "special_instructions": event.specialInstructions,
        "lat": event.lat,
        "lng": event.lng,
        "house_no": event.houseNo,
        "street": event.street,
        "city": event.city,
        "items": event.items.map((item) => item.toJson()).toList(),
      };

      final response = await orderApiRepository
          .checkout(data)
          .timeout(const Duration(seconds: 15));

      if (response != null &&
          response['success'] == true &&
          response['order_id'] != null &&
          response['order_number'] != null) {
        webSocketService.sendMessage({
          "type": "new_order",
          ...data,
          "order_id": response['order_id'],
          "order_number": response['order_number'],
        });

        emit(
          state.copyWith(
            apiResponse: ApiResponse.completed('Order Placed Successfully.'),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error(
              response?['message'] ?? "Invalid server response.",
            ),
          ),
        );
      }
    } catch (e) {
      print('Unexpected error: $e');
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }
}
