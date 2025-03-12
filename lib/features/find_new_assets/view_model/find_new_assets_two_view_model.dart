import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class FindNewAssetsTwoViewModel extends ChangeNotifier {
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  bool _isScanning = false;
  bool get isScanning => _isScanning;

  List<Beacon> _beacons = [];
  List<Beacon> get beacons => _beacons;

  List<ScanResult> _devices = [];
  List<ScanResult> get devices => _devices;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  StreamSubscription<RangingResult>? _beaconSubscription;

  Future<void> startBeaconScan() async {
    // Initialize beacon scanning
    await flutterBeacon.initializeScanning;
    
    if (_isScanning) return;

    _beacons.clear();
    _isScanning = true;
    notifyListeners();

    final regions = <Region>[
      Region(identifier: 'MyRegion', proximityUUID: 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'), // Replace with actual UUID
    ];

    _beaconSubscription = flutterBeacon.ranging(regions).listen((RangingResult result) {
      _beacons = result.beacons;
      notifyListeners();
    });
  }

  void stopBeaconScan() {
    if (!_isScanning) return;

    _beaconSubscription?.cancel();
    _isScanning = false;
    notifyListeners();
  }

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

  List<Beacon> getFilteredBeacons() {
    if (_searchQuery.isEmpty) return _beacons;

    final lowercaseQuery = _searchQuery.toLowerCase();
    return _beacons.where((beacon) =>
      beacon.proximityUUID.toLowerCase().contains(lowercaseQuery) ||
      beacon.major.toString().contains(lowercaseQuery) ||
      beacon.minor.toString().contains(lowercaseQuery)
    ).toList();
  }
}
