import 'dart:convert';
import 'package:flutter/material.dart';
import '../../model/location/location_details/locations_details_model.dart';
import '../storage/local_storage.dart';

class LocationSessionController {
  final LocalStorage _localStorage = LocalStorage();

  /// Singleton instance
  static final LocationSessionController _instance =
  LocationSessionController._internal();

  static LocationDetailsModel locationDetails = const LocationDetailsModel();

  LocationSessionController._internal() {
    _loadLocationOnStart();
  }

  factory LocationSessionController() => _instance;

  Future<void> saveLocation(LocationDetailsModel location) async {
    final String locationJson = jsonEncode(location.toJson());
    await _localStorage.setValue('location', locationJson);
    locationDetails = location;
  }

  Future<void> loadLocation() async {
    await _loadLocationOnStart();
  }

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

  Future<void> clearLocation() async {
    try {
      await _localStorage.clearValue('location');
      locationDetails = const LocationDetailsModel();
    } catch (e) {
      debugPrint('Error clearing location: $e');
    }
  }

  /// Getters

  bool get hasLocation => locationDetails.success;
  Place? get currentPlace => locationDetails.place;
  String get errorMessage => locationDetails.error;
}
