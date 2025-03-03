import 'package:flutter/material.dart';

class RegisterAssetScreen extends StatefulWidget {
  @override
  _RegisterAssetScreenState createState() => _RegisterAssetScreenState();
}

class _RegisterAssetScreenState extends State<RegisterAssetScreen> {
  TextEditingController _controller = TextEditingController();
  String _distance = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Register Asset", style: TextStyle(fontSize: 16)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Distance in Meters
            const Text(
              "Asset Name",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Distance Input TextField
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Enter name",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 10),

            const Text(
              "Set Distance",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Add this Slider widget
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Slider(
                value: double.parse(_distance),
                min: 0,
                max: 20,
                divisions: 100,
                label: _distance,
                onChanged: (double value) {
                  setState(() {
                    _distance = value.toStringAsFixed(0);
                  });
                },
                activeColor: Colors.black,
                inactiveColor: Colors.grey[300],
              ),
            ),

            // Optional: Add a row to show numeric value
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${_distance} meters',style: TextStyle(fontSize: 16),),
              ],
            ),

            const SizedBox(height: 20),
            // Asset Info Card
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Asset Info:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // First Row: Asset ID
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Asset ID:", style: TextStyle(fontSize: 14)),
                        Text("12:12:12:12"), // Replace with dynamic data
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Second Row: Asset Distance
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Asset Distance:",
                            style: TextStyle(fontSize: 14)),
                        Text("$_distance meters"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
