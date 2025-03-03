import 'package:flutter/material.dart';

class RegisteredCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const RegisteredCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // First Column: Three Texts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.black)),
                Text(description, style: const TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
            // Second Column: Row with Two Icons (Edit & Delete)
            Row(
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit,),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
