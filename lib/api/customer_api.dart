import 'package:online_pharmacy/models/customer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import '../config/app_config.dart';

Future<Customer> fetchCustomer(CookieRequest request) async {
  final response = await request.get("$apiUrl/customer/profile");
  
  return Customer.fromJson(response);
}