part of 'wish_list_bloc.dart';

class WishListState extends Equatable {
  final ApiResponse<String> apiResponse;
  final WishListModel wishListModel;

  const WishListState({
    this.wishListModel = const WishListModel(),
    this.apiResponse = const ApiResponse.completed(''),
  });

  WishListState copyWith({
    ApiResponse<String>? apiResponse,
    WishListModel? wishListModel,
  }) {
    return WishListState(
      apiResponse: apiResponse ?? this.apiResponse,
      wishListModel: wishListModel ?? this.wishListModel,
    );
  }

  @override
  List<Object> get props => [apiResponse, wishListModel];
}
