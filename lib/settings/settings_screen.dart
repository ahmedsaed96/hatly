import 'package:flutter/material.dart';
import 'package:shop_abdullah_mansour/settings/update_profile_screen.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text('Edit Your Information'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdateProfileScreen())),
                ),
              ),
              Card(
                child: ListTile(
                  trailing: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  onTap: () => signOut(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
