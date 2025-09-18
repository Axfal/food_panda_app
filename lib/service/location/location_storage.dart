import 'dart:convert';
import '../../config/routes/route_export.dart';
import '../../model/location/location_details/locations_details_model.dart';
import '../../model/google_map_location_details_model/google_map_api_model.dart';
import '../storage/local_storage.dart';

class LocationSessionController {
  final LocalStorage _localStorage = LocalStorage();

  static final LocationSessionController _instance =
  LocationSessionController._internal();

  static LocationDetailsModel locationDetails = const LocationDetailsModel();
  static GoogleMapApiModel? googleMapApiModel;

  LocationSessionController._internal() {
    _loadLocationOnStart();
    _loadGoogleMapLocationOnStart();
  }

  factory LocationSessionController() => _instance;

  /// ✅ Save user-defined location
  Future<void> saveLocation(LocationDetailsModel location) async {
    final String locationJson = jsonEncode(location.toJson());
    await _localStorage.setValue('location', locationJson);
    locationDetails = location;
  }

  /// ✅ Save Google Maps API location response
  Future<void> saveGoogleMapLocation(GoogleMapApiModel googleMapModel) async {
    final String googleJson = jsonEncode(googleMapModel.toJson());
    await _localStorage.setValue('google_map_location', googleJson);
    googleMapApiModel = googleMapModel;
  }

  /// ✅ Load stored user location
  Future<void> loadLocation() async => _loadLocationOnStart();

  Future<void> _loadLocationOnStart() async {
    try {
      final String? storedData = await _localStorage.readValue('location');
      if (storedData != null && storedData.isNotEmpty) {
        locationDetails = LocationDetailsModel.fromJson(jsonDecode(storedData));
      } else {
        locationDetails = const LocationDetailsModel();
      }
    } catch (e) {
      debugPrint('Error loading location from storage: $e');
      locationDetails = const LocationDetailsModel();
    }
  }

  /// ✅ Load stored Google Maps API response
  Future<void> loadGoogleMapLocation() async => _loadGoogleMapLocationOnStart();

  Future<void> _loadGoogleMapLocationOnStart() async {
    try {
      final String? storedData =
      await _localStorage.readValue('google_map_location');
      if (storedData != null && storedData.isNotEmpty) {
        googleMapApiModel = GoogleMapApiModel.fromJson(jsonDecode(storedData));
      } else {
        googleMapApiModel = null;
      }
    } catch (e) {
      debugPrint('Error loading google map location: $e');
      googleMapApiModel = null;
    }
  }

  /// ✅ Clear all stored location data
  Future<void> clearLocation() async {
    try {
      await _localStorage.clearValue('location');
      await _localStorage.clearValue('google_map_location');
      locationDetails = const LocationDetailsModel();
      googleMapApiModel = null;
    } catch (e) {
      debugPrint('Error clearing location: $e');
    }
  }

  /// ✅ Checks
  bool get hasLocation => locationDetails.success;
  bool get hasCurrentLocation =>
      googleMapApiModel?.results != null &&
          (googleMapApiModel?.results?.isNotEmpty ?? false);

  /// ✅ Getters
  Place? get currentPlace => locationDetails.place;
  String get errorMessage => locationDetails.error;
}
