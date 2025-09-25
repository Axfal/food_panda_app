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
    on<AddProductReviewEvent>(_onAddProductReviewEvent);
  }

  Future<void> _onFetchProductReviewEvent(
    FetchProductReviewEvent event,
    Emitter<ProductReviewState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    Map<String, dynamic> data = {
      'restaurant_id': event.restaurantId.toString(),
      'menu_item_id': event.menuItemId.toString(),
    };
    print(data);

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

  Future<void> _onAddProductReviewEvent(
    AddProductReviewEvent event,
    Emitter<ProductReviewState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = <String, dynamic>{
      'restaurant_id': event.restaurantId,
      'menu_item_id': event.menuItemId,
      'user_id': event.userId,
      'rating': event.ratting,
      'review_text': event.reviewText,
    };

    try {
      final response = await productReviewApiRepository.addProductReview(data);

      if (response != null) {
        if (response['success'] == true && response['message'] != null) {
          final newReview = Reviews(
            id: response['review']?['id'],
            userId: event.userId,
            rating: event.ratting,
            reviewText: event.reviewText,
            createdAt: DateTime.now().toIso8601String(),
            userName: response['review']?['user_name'],
          );

          final currentModel = state.getProductReviewModel;

          GetProductReviewModel? updatedModel;
          if (currentModel != null) {
            final updatedReviews = List<Reviews>.from(
              currentModel.reviews ?? [],
            )..insert(0, newReview);
            updatedModel = GetProductReviewModel(
              success: currentModel.success,
              restaurantId: currentModel.restaurantId,
              menuItemId: currentModel.menuItemId,
              averageRating: currentModel.averageRating,
              totalReviews: (currentModel.totalReviews ?? 0) + 1,
              reviews: updatedReviews,
            );
          } else {
            updatedModel = GetProductReviewModel(
              success: true,
              restaurantId: event.restaurantId,
              menuItemId: event.menuItemId,
              averageRating: event.ratting,
              totalReviews: 1,
              reviews: [newReview],
            );
          }

          emit(
            state.copyWith(
              apiResponse: ApiResponse.completed(
                response['message'] ?? "Review added successfully",
              ),
              getProductReviewModel: updatedModel,
            ),
          );
        } else {
          final errorMsg = response['error'] ?? "Error while adding review";
          emit(state.copyWith(apiResponse: ApiResponse.error(errorMsg)));
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
    }
  }
}
