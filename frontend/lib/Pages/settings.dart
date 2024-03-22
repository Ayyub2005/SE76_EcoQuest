import 'package:flutter/material.dart';

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Game Settings'),
        ),
        body: SettingsBody(),
      ),
    );
  }
}

class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Graphics Settings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('Resolution'),
            subtitle: Text('High'),
            onTap: () {
              // Add logic to change resolution
            },
          ),
          ListTile(
            title: Text('Graphics Quality'),
            subtitle: Text('Ultra'),
            onTap: () {
              // Add logic to change graphics quality
            },
          ),
          SizedBox(height: 20),
          Text(
            'Sound Settings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('Sound Effects'),
            trailing: Switch(
              value: true, // Set initial value here
              onChanged: (bool value) {
                // Add logic to toggle sound effects
              },
            ),
          ),
          ListTile(
            title: Text('Background Music'),
            trailing: Switch(
              value: true, // Set initial value here
              onChanged: (bool value) {
                // Add logic to toggle background music
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Other Settings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('Reset Game Progress'),
            onTap: () {
              // Add logic to reset game progress
            },
          ),
        ],
      ),
    );
  }
}
