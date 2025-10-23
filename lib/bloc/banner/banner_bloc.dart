// ignore_for_file: avoid_print

import 'package:excellent_trade_app/model/banner/banner_model.dart';
import 'package:excellent_trade_app/repository/banner/banner_api_repository.dart';
import '../../config/routes/route_export.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerApiRepository bannerApiRepository;

  BannerBloc({required this.bannerApiRepository}) : super(const BannerState()) {
    on<FetchBannerEvent>(_onFetchBanner);
  }

  Future<void> _onFetchBanner(
    FetchBannerEvent event,
    Emitter<BannerState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    try {
      final response = await bannerApiRepository.getBannersResponse();

      if (response == null) {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error('No response from server'),
          ),
        );
        return;
      }

      final bannerModel = BannerModel.fromJson(response);

      if (bannerModel.success == true && bannerModel.banners != null) {
        emit(
          state.copyWith(
            bannerModel: bannerModel,
            apiResponse: ApiResponse.completed('Data fetched successfully'),
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiResponse: ApiResponse.error('Error while fetching data'),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(apiResponse: ApiResponse.error('Error: $e')));
      debugPrint('BannerBloc error: $e');
    }
  }
}
