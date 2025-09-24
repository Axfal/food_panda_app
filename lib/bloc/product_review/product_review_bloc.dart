// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/repository/product_review/product_review_api_repository.dart';
import '../../model/product_review/get_product_review_model.dart';

part 'product_review_event.dart';
part 'product_review_state.dart';

class ProductReviewBloc extends Bloc<ProductReviewEvent, ProductReviewState> {
  final ProductReviewApiRepository productReviewApiRepository;

  ProductReviewBloc({required this.productReviewApiRepository})
    : super(const ProductReviewState()) {
    on<FetchProductReviewEvent>(_onFetchProductReviewEvent);
  }

  Future<void> _onFetchProductReviewEvent(
    FetchProductReviewEvent event,
    Emitter<ProductReviewState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    Map<String, dynamic> data = {
      'restaurant_id': event.restaurantId,
      'menu_item_id': event.menuItemId,
    };

    try {
      final response = await productReviewApiRepository.getProductReview(data);

      if (response != null) {
        if (response['success'] == true && response['reviews'] != null) {
          final model = GetProductReviewModel.fromJson(response);

          emit(
            state.copyWith(
              apiResponse: const ApiResponse.completed(
                "Reviews fetched successfully",
              ),
              getProductReviewModel: model,
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? 'Error while fetching reviews',
              ),
            ),
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
      emit(state.copyWith(apiResponse: ApiResponse.error('Exception: $e')));
      print('error: $e');
    }
  }
}
