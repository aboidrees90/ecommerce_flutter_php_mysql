import 'package:ecommerce_php/routes.dart';
import 'package:ecommerce_php/services/user_cache.dart';
import 'package:ecommerce_php/ui/authentication/sign_in_screen.dart';
import 'package:ecommerce_php/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: FutureBuilder(
        future: UserCache.read(),
        builder: (context, snapshot) => (snapshot.data == null) ? SignInScreen() : DashboardScreen(),
      ),
      getPages: routes,
    );
  }
}
