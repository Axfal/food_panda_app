import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  /// Request all required permissions: Location, Storage / Media
  static Future<bool> requestPermissions() async {
    final statuses = await [
      Permission.location,
      Permission.locationWhenInUse,
      Permission.photos, // for iOS / Android 33+
      Permission.storage, // for Android <= 32
    ].request();

    bool allGranted = statuses.values.every((status) => status.isGranted);

    return allGranted;
  }

  /// Check if all permissions are already granted
  static Future<bool> checkPermissions() async {
    bool locationGranted = await Permission.location.isGranted ||
        await Permission.locationWhenInUse.isGranted;
    bool storageGranted = await Permission.storage.isGranted ||
        await Permission.photos.isGranted;

    return locationGranted && storageGranted;
  }

  /// Open app settings if user denied permissions permanently
  static Future<void> openAppSettingsIfNeeded() async {
    bool canOpen = await Permission.location.isPermanentlyDenied ||
        await Permission.storage.isPermanentlyDenied ||
        await Permission.photos.isPermanentlyDenied;

    if (canOpen) {
      openAppSettings();
    }
  }
}
