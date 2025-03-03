import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.notification,
    ].request();

    // Handle permission results
    statuses.forEach((permission, status) {
      print('$permission: $status');
    });
  }

  static Future<bool> checkPermissions() async {
    bool locationGranted = await Permission.location.isGranted;
    bool bluetoothGranted = await Permission.bluetooth.isGranted;
    bool notificationGranted = await Permission.notification.isGranted;

    return locationGranted && bluetoothGranted && notificationGranted;
  }
}
