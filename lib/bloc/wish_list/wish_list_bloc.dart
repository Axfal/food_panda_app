// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/wish_list/wish_list_model.dart';
import 'package:excellent_trade_app/repository/wish_list/wish_list_api_repository.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  final WishListApiRepository wishListApiRepository;

  WishListBloc({required this.wishListApiRepository})
      : super(const WishListState()) {
    on<FetchWishListEvent>(_onFetchWishListEvent);
    on<AddWishListEvent>(_onAddWishListEvent);
    on<RemoveWishListEvent>(_onRemoveWishListEvent);
  }

  Future<void> _onFetchWishListEvent(
      FetchWishListEvent event, Emitter<WishListState> emit) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));
    try {
      final response = await wishListApiRepository.fetchWishList({
        "user_id": event.userId,
      });

      if (response != null &&
          response['success'] == true &&
          response['restaurants'] != null) {
        final wishListModel = WishListModel.fromJson(response);
        emit(state.copyWith(
          apiResponse: ApiResponse.completed("Fetched successfully"),
          wishListModel: wishListModel,
        ));
      } else {
        emit(state.copyWith(
          apiResponse: ApiResponse.error("Failed to fetch wishlist"),
        ));
      }
    } catch (e, st) {
      print("Error in FetchWishListEvent: $e\n$st");
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }

  Future<void> _onAddWishListEvent(
      AddWishListEvent event, Emitter<WishListState> emit) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));
    try {
      final response = await wishListApiRepository.addWishList({
        "user_id": event.userId,
        "restaurant_id": event.restaurantId,
        "action": event.action,
      });

      if (response != null && response['success'] == true) {
        emit(state.copyWith(
            apiResponse: ApiResponse.completed("Added to wishlist")));
        // Optionally re-fetch updated list
        add(FetchWishListEvent(userId: event.userId));
      } else {
        emit(state.copyWith(
            apiResponse: ApiResponse.error("Failed to add to wishlist")));
      }
    } catch (e, st) {
      print("Error in AddWishListEvent: $e\n$st");
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }

  Future<void> _onRemoveWishListEvent(
      RemoveWishListEvent event, Emitter<WishListState> emit) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));
    try {
      final response = await wishListApiRepository.removeWishList({
        "user_id": event.userId,
        "restaurant_id": event.restaurantId,
        "action": event.action,
      });

      if (response != null && response['success'] == true) {
        emit(state.copyWith(
            apiResponse: ApiResponse.completed("Removed from wishlist")));
        // Optionally refetch updated list
        add(FetchWishListEvent(userId: event.userId));
      } else {
        emit(state.copyWith(
            apiResponse: ApiResponse.error("Failed to remove from wishlist")));
      }
    } catch (e, st) {
      print("Error in RemoveWishListEvent: $e\n$st");
      emit(state.copyWith(apiResponse: ApiResponse.error(e.toString())));
    }
  }
}
