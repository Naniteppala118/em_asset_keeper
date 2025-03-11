import 'package:em_asset_keeper/features/find_new_assets/model/bluetooth_device_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class FindNewAssetsTwoViewModel extends ChangeNotifier {
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  bool _isScanning = false;
  bool get isScanning => _isScanning;

  List<ScanResult> _devices = [];
  List<ScanResult> get devices => _devices;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void togglePlayPause() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void startScan() {
    if (_isScanning) return;

    _devices.clear();
    _isScanning = true;
    notifyListeners();

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      _devices = results;
      notifyListeners();
    });
  }

  void stopScan() {
    if (!_isScanning) return;

    FlutterBluePlus.stopScan();
    _isScanning = false;
    notifyListeners();
  }

  void toggleScan() {
    _isScanning ? stopScan() : startScan();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<ScanResult> getFilteredDevices() {
    if (_searchQuery.isEmpty) return _devices;

    final lowercaseQuery = _searchQuery.toLowerCase();
    return _devices.where((device) =>
      device.device.name.toLowerCase().contains(lowercaseQuery) ||
      device.device.id.toString().toLowerCase().contains(lowercaseQuery)
    ).toList();
  }
}
