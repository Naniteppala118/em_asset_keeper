import 'package:em_asset_keeper/features/qr_code_screen/qr_code_screen.dart';
import 'package:em_asset_keeper/routes/route_list.dart';
import 'package:em_asset_keeper/services/navigation_service.dart';
import 'package:flutter/material.dart';

class NewAssetScreen extends StatelessWidget {
  const NewAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Find New Assets", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              NavigationServices().navigateTo(RoutesLists.findNewAssetsTwo);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Scan QR Code",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrCodeScreen(),
                  ),
                );
                if (result != null) {
                  // Handle the scanned QR code result here
                  print('Scanned QR Code: $result');
                }
              },
              child: Image.asset(
                'assets/pay.png',
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
