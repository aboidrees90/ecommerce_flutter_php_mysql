import 'package:ecommerce_php/core/constants/theme.dart';
import 'package:ecommerce_php/features/Home/home_screen.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/features/account/authentication/sign_in_screen.dart';
import 'package:ecommerce_php/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Auth _auth = Get.put(Auth());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.cairo().fontFamily,
        primarySwatch: Colors.amber,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.cairo().fontFamily,
        primarySwatch: Colors.amber,
        colorScheme: darkColorScheme,
      ),
      home: FutureBuilder(
        future: _auth.initializeAuth(),
        builder: (context, snapshot) => (_auth.currentUser == null) ? SignInScreen() : HomeScreen(),
      ),
      getPages: routes,
    );
  }
}
