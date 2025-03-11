import 'package:em_asset_keeper/features/find_new_assets/view_model/find_new_assets_two_view_model.dart';
import 'package:em_asset_keeper/features/widgets/bluetooth_device_card.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class FindNewAssetsScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FindNewAssetsTwoViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            _buildSearchField(context),
            _buildDevicesList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text("Find New Assets", style: TextStyle(fontSize: 16)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.qr_code),
          onPressed: () {},
        ),
        Consumer<FindNewAssetsTwoViewModel>(
          builder: (context, viewModel, _) => IconButton(
            icon: Icon(viewModel.isScanning ? Icons.pause : Icons.play_arrow),
            onPressed: () {
                viewModel.toggleScan();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<FindNewAssetsTwoViewModel>(
        builder: (context, viewModel, _) {
          return TextField(
            onChanged: viewModel.updateSearchQuery,
            decoration: InputDecoration(
              hintText: 'Search by name or mac address',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: viewModel.searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        viewModel.updateSearchQuery('');
                      },
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildDevicesList() {
    return Expanded(
      child: Consumer<FindNewAssetsTwoViewModel>(
        builder: (context, viewModel, _) {
          final devices = viewModel.getFilteredDevices();
          return devices.isEmpty
              ? const Center(child: Text("No devices found"))
              : ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final device = devices[index];
                    return BluetoothDeviceCard(
                      name: device.device.name.isNotEmpty
                          ? device.device.name
                          : "Unknown Device",
                      ipAddress: device.device.id.toString(),
                      signalStrength: device.rssi.toString(),
                    );
                  },
                );
        },
      ),
    );
  }
}
