// ignore_for_file: avoid_print
import 'package:excellent_trade_app/repository/order/order_api_repository.dart';
import '../../config/routes/route_export.dart';
import '../../model/delivery_address/order_request_model.dart';
import '../../service/web_socket_service/web_socket_service.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderApiRepository orderApiRepository;
  final WebSocketService webSocketService;

  OrderBloc({required this.orderApiRepository, required this.webSocketService})
    : super(const OrderState()) {
    on<CheckOutEvent>(_onCheckout);
  }

  Future<void> _onCheckout(
    CheckOutEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    try {
      /// Build request payload to match API JSON
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
        final wsService = WebSocketService(url: "wss://itgenesis.space/ws/");
        wsService.connect();

        if (wsService.isConnected) {
          wsService.sendMessage({"type": "new_order", "order_id": 123});
        }

        webSocketService.sendMessage({
          "type": "new_order",
          "order_id": response['order_id'],
          "order_number": response['order_number'],
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
