// ignore_for_file: avoid_print

import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/repository/search/search_api_response.dart';
import '../../model/search/search_model.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchApiRepository searchApiRepository;
  SearchBloc({required this.searchApiRepository}) : super(SearchState()) {
    on<FetchSearchResult>(_onFetchSearchResults);
  }
  void _onFetchSearchResults(
    FetchSearchResult event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(apiResponse: ApiResponse.loading()));
    try {
      Map<String, dynamic> data = {
        "query": event.query,
        "lat": event.lat,
        "lng": event.lng,
      };
      final response = await searchApiRepository.search(data);
      if (response != null) {
        if (response['success'] == true && response['results'] != null) {
          emit(state.copyWith(searchModel: response));
          emit(
            state.copyWith(apiResponse: ApiResponse.completed("data fetched")),
          );
        } else {
          emit(
            state.copyWith(
              apiResponse: ApiResponse.error(
                response['error'] ?? "error while fetching the data",
              ),
            ),
          );
        }
      } else {
        print('no response from server');
      }
    } catch (e) {
      print('error: $e');
    }
  }
}
