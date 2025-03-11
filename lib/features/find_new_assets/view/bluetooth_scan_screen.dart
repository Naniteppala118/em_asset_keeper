import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothScanScreen extends StatefulWidget {
  @override
  State<BluetoothScanScreen> createState() => _BluetoothScanScreenState();
}

class _BluetoothScanScreenState extends State<BluetoothScanScreen> {
  FlutterBluePlus flutterBlue = FlutterBluePlus();  List<ScanResult> _devices = [];
  bool _isScanning = false;

  void _toggleScan() {
    if (_isScanning) {
      FlutterBluePlus.stopScan();
    } else {
      _devices.clear();
      FlutterBluePlus.startScan(timeout: Duration(seconds: 5));
      
      FlutterBluePlus.scanResults.listen((results) {
        setState(() {
          _devices = results;
        });
      });
    }
    setState(() {
      _isScanning = !_isScanning;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Bluetooth Devices'),
        actions: [
          IconButton(
            icon: Icon(_isScanning ? Icons.bluetooth_disabled : Icons.bluetooth_searching),
            onPressed: _toggleScan,
          ),
        ],
      ),
      body: _devices.isEmpty
          ? const Center(child: Text("No devices found"))
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (context, index) {
                final device = _devices[index];
                return ListTile(
                  title: Text(device.device.name.isNotEmpty ? device.device.name : "Unknown Device"),
                  subtitle: Text(device.device.id.toString()),
                  trailing: Text("RSSI: ${device.rssi}"),
                );
              },
            ),
    );
  }
}
