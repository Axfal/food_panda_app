// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/recommendation/recommended_items.dart';
import 'package:excellent_trade_app/repository/recommendation/recommendation_api_repo.dart';

part 'recommendation_event.dart';
part 'recommendation_state.dart';

class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  final RecommendationApiRepository recommendationApiRepository;

  RecommendationBloc({required this.recommendationApiRepository})
    : super(const RecommendationState()) {
    on<FetchRecommendedItemsEvent>(_onFetchRecommendedItems);
  }

  Future<void> _onFetchRecommendedItems(
    FetchRecommendedItemsEvent event,
    Emitter<RecommendationState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    final data = {
      "restaurant_id": event.restaurantId,
      "cart_items": event.cartItem,
    };

    try {
      final response = await recommendationApiRepository.recommendedItem(data);

      if (response != null) {
        if (response['success'] == true &&
            response['recommendations'] != null) {
          final recommendedItemModel = RecommendedItemModel.fromJson(response);

          emit(
            state.copyWith(
              apiResponse: const ApiResponse.completed("Success"),
              recommendedItemModel: recommendedItemModel,
            ),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: const ApiResponse.error(
                "Invalid response from server",
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            apiResponse: const ApiResponse.error("No response from server"),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(apiResponse: ApiResponse.error("Error: $e")));
      print('error: $e');
    }
  }
}
