import 'package:ecommerce_php/user/authentication/sign_in_screen.dart';
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
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: FutureBuilder(
        builder: (context, snapshot) => const SingInScreen(),
      ),
    );
  }
}
