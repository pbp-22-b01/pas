import 'package:flutter/material.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Home"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/admin/home"),
          ),
          ListTile(
            title: const Text("Obat"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/medicine/list"),
          )
        ],
      ),
    );
  }
}
