part of 'banner_bloc.dart';

class BannerState extends Equatable {
  final BannerModel bannerModel;
  final ApiResponse<String> apiResponse;
  const BannerState({
    this.apiResponse = const ApiResponse.completed(''),
    this.bannerModel = const BannerModel(),
  });

  BannerState copyWith({
    final BannerModel? bannerModel,
    final ApiResponse<String>? apiResponse,
  }) {
    return BannerState(
      apiResponse: apiResponse ?? this.apiResponse,
      bannerModel: bannerModel ?? this.bannerModel,
    );
  }

  @override
  List<Object> get props => [apiResponse, bannerModel];
}
