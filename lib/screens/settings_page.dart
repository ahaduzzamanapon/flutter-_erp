import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      drawer: AppDrawer(),
      body: Center(
        child: Text("This is the Settings Page", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
