import 'package:pbp_django_auth/pbp_django_auth.dart';

import '../config/app_config.dart';

Future<dynamic> logout(CookieRequest request) async {
  return await request.post("$apiUrl/accounts/logout/json", {});
}