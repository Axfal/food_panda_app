abstract class LocationApiResponse {
  Future<dynamic> locationSuggestion(dynamic data);
  Future<dynamic> locationDetails(dynamic data);
  Future<dynamic> googleMapLocationDetails(double lat, double lng);
}