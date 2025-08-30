part of 'search_bloc.dart';

class SearchState extends Equatable {
  final SearchModel searchModel;
  final ApiResponse apiResponse;

  const SearchState({
    this.searchModel = const SearchModel(),
    this.apiResponse = const ApiResponse.completed(''),
  });

  SearchState copyWith({
    SearchModel? searchModel,
    ApiResponse? apiResponse,
  }) {
    return SearchState(
      searchModel: searchModel ?? this.searchModel,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  List<Object> get props => [searchModel, apiResponse];
}
