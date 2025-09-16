part of 'recommendation_bloc.dart';

class RecommendationState extends Equatable {
  final ApiResponse<String> apiResponse;
  final RecommendedItemModel recommendedItemModel;

  const RecommendationState({
    this.apiResponse = const ApiResponse.completed(''),
    this.recommendedItemModel = const RecommendedItemModel(),
  });

  RecommendationState copyWith({
    final ApiResponse<String>? apiResponse,
    final RecommendedItemModel? recommendedItemModel,
  }) {
    return RecommendationState(
      apiResponse: apiResponse ?? this.apiResponse,
      recommendedItemModel: recommendedItemModel ?? this.recommendedItemModel,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
