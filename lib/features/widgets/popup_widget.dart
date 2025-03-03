import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onOkPressed;

  const PopupWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Description
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),

            // OK Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onOkPressed,
                child: const Text("OK", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
