import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 60.0, backgroundImage: AssetImage("image2.jpg")),
            const SizedBox(height: 16.0),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'App Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle navigation to the orders screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.white),
              title: const Text(
                'Account',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle navigation to the orders screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2, color: Colors.white),
              title: const Text(
                'Change account name',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle navigation to the orders screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.white),
              title: const Text(
                'Change account password',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle navigation to the favorites screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.white),
              title: const Text(
                'Change account image',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle navigation to the shipping screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.line_weight, color: Colors.white),
              title: const Text(
                'Uptodo',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle navigation to the card screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_sharp, color: Colors.white),
              title: const Text(
                'FAQ',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle navigation to the card screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
