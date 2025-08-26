import 'location_exports.dart';

class LocationHttpApiResponse implements LocationApiResponse {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future locationDetails(dynamic data) async {
    final uri = Uri.parse(AppUrl.locationDetails).replace(queryParameters: data);
    final response = await _apiServices.getApi(uri.toString());
    return response;
  }

  @override
  Future locationSuggestion(dynamic data) async {
    final uri = Uri.parse(AppUrl.locationSuggestion).replace(queryParameters: data);
    final response = await _apiServices.getApi(uri.toString());
    return response;
  }
}
