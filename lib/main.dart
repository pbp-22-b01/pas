import 'package:flutter/material.dart';
import 'package:online_pharmacy/pages/admin_home_page.dart';
import 'package:online_pharmacy/pages/home_page.dart';
import 'package:online_pharmacy/pages/login_page.dart';
import 'package:online_pharmacy/pages/medicine/medicine_list_page.dart';
import 'package:online_pharmacy/pages/market_page.dart';
import 'package:online_pharmacy/pages/pharmacy/pharmacy.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:online_pharmacy/pages/customer/profile_page.dart';
import 'package:online_pharmacy/pages/customer_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Online Pharmacy',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomePage(),
        routes: {
          "/home": (BuildContext context) => const HomePage(),
          "/login": (BuildContext context) => const LoginPage(),
          "/admin/home": (BuildContext context) => const AdminHomePage(),
          "/medicine/list": (BuildContext context) => MedicineListPage(),
          "/pharmacy/list": (BuildContext context) => PharmacyPage(),
          "/market": (BuildContext context) => const MarketPage(),
          "/customer/home": (BuildContext context) =>  const CustomerHomePage(),
          "/customer/profile/edit": (BuildContext context) => const ProfilePage(),
        },
      ),
    );
  }
}