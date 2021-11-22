import 'package:permission_handler/permission_handler.dart';

Future<bool> locationPermission() async {
  final PermissionStatus status = await Permission.location.request();
  if (status.isPermanentlyDenied || status.isRestricted) {
    await openAppSettings();
  }

  if (status.isGranted) {
    return true;
  }
  return false;
}
