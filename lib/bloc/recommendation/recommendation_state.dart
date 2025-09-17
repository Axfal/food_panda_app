part of 'recommendation_bloc.dart';

class RecommendationState extends Equatable {
  final ApiResponse<String> apiResponse;
  final RecommendedItemModel recommendedItemModel;

  const RecommendationState({
    this.apiResponse = const ApiResponse.completed(''),
    this.recommendedItemModel = const RecommendedItemModel(),
  });

  RecommendationState copyWith({
    ApiResponse<String>? apiResponse,
    RecommendedItemModel? recommendedItemModel,
  }) {
    return RecommendationState(
      apiResponse: apiResponse ?? this.apiResponse,
      recommendedItemModel: recommendedItemModel ?? this.recommendedItemModel,
    );
  }

  @override
  List<Object?> get props => [apiResponse, recommendedItemModel];
}
