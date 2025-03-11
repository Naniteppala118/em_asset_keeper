import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestPermissionsSequentially() async {
    await _requestPermission(Permission.bluetooth);
    await _requestPermission(Permission.bluetoothScan);
    await _requestPermission(Permission.bluetoothConnect);
    await _requestPermission(Permission.location);
    await _requestPermission(Permission.notification);
  }

  static Future<void> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      print('${permission.toString()} is already granted.');
      return;
    }

    PermissionStatus status = await permission.request();
    
    if (status.isGranted) {
      print('${permission.toString()} granted.');
    } else if (status.isDenied) {
      print('${permission.toString()} denied.');
    } else if (status.isPermanentlyDenied) {
      print('${permission.toString()} permanently denied. Open settings to enable.');
      openAppSettings(); // Open settings if permanently denied
    }
  }

  static Future<bool> checkPermissions() async {
    bool locationGranted = await Permission.location.isGranted;
    bool bluetoothGranted = await Permission.bluetooth.isGranted;
    bool notificationGranted = await Permission.notification.isGranted;

    return locationGranted && bluetoothGranted && notificationGranted;
  }
}
