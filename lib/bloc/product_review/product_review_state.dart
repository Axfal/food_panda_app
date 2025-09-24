part of 'product_review_bloc.dart';

class ProductReviewState extends Equatable {
  final ApiResponse<String> apiResponse;
  final GetProductReviewModel? getProductReviewModel;

  const ProductReviewState({
    this.apiResponse = const ApiResponse.completed(''),
    this.getProductReviewModel,
  });

  ProductReviewState copyWith({
    ApiResponse<String>? apiResponse,
    GetProductReviewModel? getProductReviewModel,
  }) {
    return ProductReviewState(
      apiResponse: apiResponse ?? this.apiResponse,
      getProductReviewModel:
          getProductReviewModel ?? this.getProductReviewModel,
    );
  }

  @override
  List<Object?> get props => [apiResponse, getProductReviewModel];
}
