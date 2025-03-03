import 'package:em_asset_keeper/features/find_new_assets/model/bluetooth_device_model.dart';
import 'package:flutter/material.dart';

class FindNewAssetsTwoViewModel extends ChangeNotifier {
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  List<BluetoothDevice> devices = [
    BluetoothDevice(
      name: 'Asset Tracker 1',
      macAddress: '26:D1:6F:B1:08:01',
      signalStrength: 'Strong'
    ),
    BluetoothDevice(
      name: 'Temperature Sensor',
      macAddress: '26:D1:6F:B1:08:02',
      signalStrength: 'Medium'
    ),
    BluetoothDevice(
      name: 'Location Beacon',
      macAddress: '26:D1:6F:B1:08:03',
      signalStrength: 'Weak'
    ),
  ];

  void togglePlayPause() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void updateDevices(List<BluetoothDevice> newDevices) {
    devices = newDevices;
    notifyListeners();
  }

  List<BluetoothDevice> getFilteredDevices(String query) {
    if (query.isEmpty) return devices;
    
    final lowercaseQuery = query.toLowerCase();
    return devices.where((device) =>
      device.name.toLowerCase().contains(lowercaseQuery) || 
      device.macAddress.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }

  
}
