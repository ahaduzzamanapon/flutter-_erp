import 'package:flutter/material.dart';
import '../screens/profile_page.dart';
import '../screens/settings_page.dart';
import '../screens/home_page.dart';
import '../services/api_service.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(ApiService.userData),
            accountEmail: Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('	https://hrseba.mysoftheaven.com/awedget/assets/img/avater.jpg'),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlue],
              ),
            ),
          ),
          buildDrawerItem(Icons.home, "Home", () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => HomePage()));
          }),
          buildDrawerItem(Icons.person, "Profile", () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => ProfilePage()));
          }),
          buildDrawerItem(Icons.settings, "Settings", () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => SettingsPage()));
          }),
          Divider(),
          buildDrawerItem(Icons.logout, "Logout", () {
            ApiService.logout(); // Clear API key on logout
            Navigator.pushReplacementNamed(context, '/login'); // Go back to login page
          }),
        ],
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }
}
