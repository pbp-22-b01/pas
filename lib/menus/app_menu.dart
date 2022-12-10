import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            title: const Text("Market"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/market");
            },
          ),
          ListTile(
            title: const Text("Login"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/login");
            },
          ),
        ],
      ),
    );
  }
}
