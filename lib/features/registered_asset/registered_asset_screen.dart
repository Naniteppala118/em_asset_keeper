import 'package:em_asset_keeper/features/widgets/button_widget.dart';
import 'package:em_asset_keeper/features/widgets/popup_widget.dart';
import 'package:em_asset_keeper/features/widgets/registered_card_widget.dart';
import 'package:em_asset_keeper/services/notification_service.dart';
import 'package:flutter/material.dart';

class RegisteredScreen extends StatelessWidget {
  const RegisteredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            const Text("My Registered Assets", style: TextStyle(fontSize: 16)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ListView inside Expanded to take available space
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 5, // Example count
              itemBuilder: (context, index) {
                return RegisteredCardWidget(
                  title: "Asset Name: Key",
                  subtitle: "Asset Id: 123456",
                  description: "Distance: 4.0 meters",
                  onEdit: () {
                    // Edit action
                  },
                  onDelete: () {
                    // Delete action
                  },
                );
              },
            ),
          ),

          // Two buttons at the bottom in a row
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    text: "Start Tracking",
                    onPressed: () async {
                      await NotificationService.showNotification(
                        title: 'Asset Tracking Started',
                        body: 'Your assets are now being tracked',
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => PopupWidget(
                          title: 'em | asset keeper',
                          description:
                              'Starting service. Press OK after getting first notification',
                          onOkPressed: () {
                            Navigator.of(context)
                                .pop(); // Close dialog when OK is pressed
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16), // Spacing between buttons
                Expanded(
                  child: ButtonWidget(
                    text: "Stop Tracking",
                    onPressed: () {
                      // Delete all action
                    },
                    color: Colors.grey, // Different color for delete
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
