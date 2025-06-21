import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Settings",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Notifications"),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {
                      // TODO: Implement notification toggle
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.volume_up),
                  title: const Text("Sound Effects"),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {
                      // TODO: Implement sound toggle
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text("Dark Mode"),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {
                      // TODO: Implement theme toggle
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text("Help & Support"),
                  onTap: () {
                    // TODO: Navigate to help screen
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("About"),
                  onTap: () {
                    // TODO: Navigate to about screen
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
