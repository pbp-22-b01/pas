import 'package:flutter/material.dart';
import 'package:online_pharmacy/api/account_api.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:online_pharmacy/pages/pharmacy/tambah_budget.dart';
import 'package:online_pharmacy/pages/pharmacy/data_budget.dart';
import 'package:online_pharmacy/pages/pharmacy/pharmacy.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Home"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed("/admin/home"),
          ),
          ListTile(
            title: const Text("Obat"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed("/medicine/list"),
          ),
          ListTile(
            title: const Text("PharmacyList"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/pharmacy/list"),
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () {
              logout(request);
              Navigator.of(context).pushNamed("/home");
            },
          ),
        ],
      ),
    );
  }
}
