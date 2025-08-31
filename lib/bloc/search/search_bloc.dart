// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/repository/search/search_api_response.dart';
import '../../model/search/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchApiRepository searchApiRepository;

  SearchBloc({required this.searchApiRepository}) : super(const SearchState()) {
    on<FetchSearchResult>(_onFetchSearchResults);
  }

  Future<void> _onFetchSearchResults(
      FetchSearchResult event,
      Emitter<SearchState> emit,
      ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));

    try {
      final Map<String, dynamic> data = {
        "query": event.query,
        "lat": event.lat,
        "lng": event.lng,
      };

      final response = await searchApiRepository.search(data);

      if (response != null) {
        if (response['success'] == true && response['results'] != null) {
          /// Parse response into SearchModel
          final searchModel = SearchModel.fromJson(response);

          emit(state.copyWith(searchModel: searchModel));
          emit(state.copyWith(
            apiResponse: const ApiResponse.completed("data fetched"),
          ));
        } else {
          emit(state.copyWith(
            apiResponse: ApiResponse.error(
              response['error'] ?? "Error while fetching the data",
            ),
          ));
        }
      } else {
        print('No response from server');
        emit(state.copyWith(
          apiResponse: const ApiResponse.error("No response from server"),
        ));
      }
    } catch (e) {
      print('Error: $e');
      emit(state.copyWith(
        apiResponse: ApiResponse.error("Exception: $e"),
      ));
    }
  }
}
