import 'package:em_asset_keeper/features/find_new_assets/view_model/find_new_assets_two_view_model.dart';
import 'package:em_asset_keeper/features/widgets/bluetooth_device_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindNewAssetsScreenTwo extends StatefulWidget {
  @override
  State<FindNewAssetsScreenTwo> createState() => _FindNewAssetsScreenTwoState();
}

class _FindNewAssetsScreenTwoState extends State<FindNewAssetsScreenTwo> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FindNewAssetsTwoViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildSearchField(),
            _buildDevicesList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
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
            icon: Icon(viewModel.isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () => viewModel.togglePlayPause(),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search by name or mac address',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _searchQuery = '';
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildDevicesList() {
    return Expanded(
      child: Consumer<FindNewAssetsTwoViewModel>(
        builder: (context, viewModel, _) {
          final devices = viewModel.getFilteredDevices(_searchQuery);
          return ListView.builder(
            itemCount: devices.length,
            itemBuilder: (context, index) {
              final device = devices[index];
              return BluetoothDeviceCard(
                name: device.name,
                ipAddress: device.macAddress,
                signalStrength: device.signalStrength,
              );
            },
          );
        },
      ),
    );
  }
}
