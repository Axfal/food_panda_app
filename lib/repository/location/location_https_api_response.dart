// ignore_for_file: avoid_print

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

  @override
  Future googleMapLocationDetails(double lat, double lng) async{
    final uri = Uri.parse(AppUrl.googleMapLocationDetail).replace(
      queryParameters: {
        "latlng": "$lat,$lng",
        "key": AppUrl.googleApiKey,
      },
    );
    print("📍 Google Maps API URL: $uri");
    final response = await _apiServices.getApi(uri.toString());
    return response;
}
}
