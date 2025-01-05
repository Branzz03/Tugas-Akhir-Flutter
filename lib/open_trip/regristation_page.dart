import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  final String tripName;

  const RegistrationPage({Key? key, required this.tripName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$tripName Registration'),
        backgroundColor: Colors.indigo.shade700,
        elevation: 12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please fill in your details to register for the $tripName.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // Add form fields like name, contact, etc.
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registration Successful for $tripName!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Register Now'),
            ),
          ],
        ),
      ),
    );
  }
}
