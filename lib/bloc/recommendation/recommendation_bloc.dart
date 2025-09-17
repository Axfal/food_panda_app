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

    final dato = {
      "success": true,
      "recommendations": [
        {
          "id": 27,
          "name": "burger",
          "category_id": 2,
          "price": "123.00",
          "photo": "uploads/menu_items/item_68a437e09732f5.40037927.png"
        },{
          "id": 27,
          "name": "burger",
          "category_id": 2,
          "price": "123.00",
          "photo": "uploads/menu_items/item_68a437e09732f5.40037927.png"
        },{
          "id": 27,
          "name": "burger",
          "category_id": 2,
          "price": "123.00",
          "photo": "uploads/menu_items/item_68a437e09732f5.40037927.png"
        },{
          "id": 27,
          "name": "burger",
          "category_id": 2,
          "price": "123.00",
          "photo": "uploads/menu_items/item_68a437e09732f5.40037927.png"
        },
        {
          "id": 3,
          "name": "Veg Pizza",
          "category_id": 2,
          "price": "1200.00",
          "photo": "uploads/menu_items/item_689c1f236ad860.47484525.png"
        },
        {
          "id": 6,
          "name": "Veg Pizza",
          "category_id": 2,
          "price": "1200.00",
          "photo": "uploads/menu_items/item_689c1f236ad860.47484525.png"
        },
        {
          "id": 6,
          "name": "Veg Pizza",
          "category_id": 2,
          "price": "1200.00",
          "photo": "uploads/menu_items/item_689c1f236ad860.47484525.png"
        },
        {
          "id": 6,
          "name": "Veg Pizza",
          "category_id": 2,
          "price": "1200.00",
          "photo": "uploads/menu_items/item_689c1f236ad860.47484525.png"
        },
        {
          "id": 6,
          "name": "Veg Pizza",
          "category_id": 2,
          "price": "1200.00",
          "photo": "uploads/menu_items/item_689c1f236ad860.47484525.png"
        },
        {
          "id": 6,
          "name": "Veg Pizza",
          "category_id": 2,
          "price": "1200.00",
          "photo": "uploads/menu_items/item_689c1f236ad860.47484525.png"
        }
      ]
    };

    try {
      final response = await recommendationApiRepository.recommendedItem(data);

      if (response != null) {
        if (response['success'] == true &&
            response['recommendations'] != null) {
          final recommendedItemModel = RecommendedItemModel.fromJson(dato);

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
