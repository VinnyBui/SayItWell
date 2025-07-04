import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../auth/login_screen.dart';
import 'home_screen.dart';
import 'progress_screen.dart';
import 'premium_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _authService = AuthService();

  Future<void> _logout() async {
    try {
      await _authService.signOut();
      
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error logging out: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Text(
          'Settings',
          style: textTheme.displayLarge?.copyWith(color: colorScheme.primary),
        ),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: _logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: Colors.black45,
          type: BottomNavigationBarType.fixed,
          currentIndex: 3,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                          const HomeScreen(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 200),
                ),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                          const ProgressScreen(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 200),
                ),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                          const PremiumScreen(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 200),
                ),
              );
            } else if (index == 3) {
              // Already on settings screen
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium),
              label: 'Premium',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
