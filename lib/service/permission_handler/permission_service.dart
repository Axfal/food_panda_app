import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static Future<bool> requestPermissions() async {
    final statuses = await [
      Permission.location,
      Permission.locationWhenInUse,
      Permission.photos,
      Permission.storage,
      Permission.contacts,
    ].request();

    bool allGranted = statuses.values.every((status) => status.isGranted);

    return allGranted;
  }

  static Future<bool> checkPermissions() async {
    bool locationGranted =
        await Permission.location.isGranted ||
        await Permission.locationWhenInUse.isGranted;
    bool storageGranted =
        await Permission.storage.isGranted || await Permission.photos.isGranted;
    bool contactsGranted = await Permission.contacts.isGranted;

    return locationGranted && storageGranted && contactsGranted;
  }

  static Future<void> openAppSettingsIfNeeded() async {
    bool canOpen =
        await Permission.location.isPermanentlyDenied ||
        await Permission.storage.isPermanentlyDenied ||
        await Permission.photos.isPermanentlyDenied ||
        await Permission.contacts.isPermanentlyDenied;

    if (canOpen) {
      openAppSettings();
    }
  }
}
