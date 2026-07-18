import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notification = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.green,
      ),

      body: ListView(
        children: [

          SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Enable dark theme"),
            secondary: const Icon(Icons.dark_mode),
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),

          const Divider(),

          SwitchListTile(
            title: const Text("Prayer Notification"),
            subtitle: const Text("Enable prayer reminder"),
            secondary: const Icon(Icons.notifications),
            value: notification,
            onChanged: (value) {
              setState(() {
                notification = value;
              });
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            subtitle: const Text("English"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.star),
            title: const Text("Rate App"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            subtitle: const Text("Islamic Companion v1.0"),
          ),
        ],
      ),
    );
  }
}
