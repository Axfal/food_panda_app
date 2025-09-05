// ignore_for_file: avoid_print
import 'package:excellent_trade_app/repository/order/order_api_repository.dart';
import '../../config/routes/route_export.dart';
import '../../model/delivery_address/delivery_address_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderApiRepository orderApiRepository;

  OrderBloc({required this.orderApiRepository}) : super(const OrderState()) {
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

      if (response != null) {
        if (response['success'] == true &&
            response['order_id'] != null &&
            response['order_number'] != null) {
          emit(state.copyWith(apiResponse: ApiResponse.completed(response)));
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['message'] ?? "Invalid server response.",
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error("No response from server."),
          ),
        );
      }
    } catch (e) {
      print('Unexpected error: $e');
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }
}
