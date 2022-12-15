import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:ecommerce_php/features/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final Auth _auth = Get.put(Auth());

  singOut() async {
    var response = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.grey,
        title: const Text("Signing out", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: const Text("Are you sure?\nyou want to sign out from app?"),
        actions: [
          TextButton(onPressed: Get.back, child: const Text("No", style: TextStyle(color: Colors.black))),
          TextButton(onPressed: () => Get.back(result: "signed_out"), child: const Text("Yes")),
        ],
      ),
    );

    if (response == "signed_out") {
      await _auth.signOut();
      if (_auth.currentUser == null) Get.toNamed(AppRoutes.signIn);
    }
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.grey.shade900),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        children: [
          Icon(iconData, size: 30, color: Colors.white),
          const SizedBox(width: 16),
          Text(userData, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: ListView(
        children: [
          Center(child: Image.asset('images/man.png', width: 240)),
          const SizedBox(height: 20),
          userInfoItemProfile(Icons.person, _auth.currentUser?.name ?? ""),
          const SizedBox(height: 20),
          userInfoItemProfile(Icons.email, _auth.currentUser?.email ?? ""),
          const SizedBox(height: 20),
          Center(
            child: Button(
              text: "Sign up",
              textSize: 16.0,
              padding: const EdgeInsets.all(4),
              color: Colors.redAccent,
              onTap: singOut,
            ),
          )
        ],
      ),
    );
  }
}
