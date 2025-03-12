import 'package:em_asset_keeper/features/find_new_assets/view_model/find_new_assets_two_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewWithBeacons extends StatelessWidget {
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
            _buildBeaconsList(),
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
              hintText: 'Search by UUID, Major, or Minor',
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

  Widget _buildBeaconsList() {
    return Expanded(
      child: Consumer<FindNewAssetsTwoViewModel>(
        builder: (context, viewModel, _) {
          final beacons = viewModel.getFilteredBeacons();
          return beacons.isEmpty
              ? const Center(child: Text("No beacons found"))
              : ListView.builder(
                  itemCount: beacons.length,
                  itemBuilder: (context, index) {
                    final beacon = beacons[index];
                    return ListTile(
                      title: Text("UUID: ${beacon.proximityUUID}"),
                      subtitle: Text("Major: ${beacon.major}, Minor: ${beacon.minor}"),
                      trailing: Text("RSSI: ${beacon.rssi}"),
                    );
                  },
                );
        },
      ),
    );
  }
}
