import 'package:flutter/material.dart';

class BluetoothDeviceCard extends StatelessWidget {
  final String name;
  final String ipAddress;
  final String signalStrength;

  const BluetoothDeviceCard({
    required this.name,
    required this.ipAddress,
    required this.signalStrength,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 25,
              child: Icon(
                Icons.bluetooth,
                size: 30,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ipAddress,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_alt,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '50 dbm',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_outward_sharp,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '50 dbm',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
