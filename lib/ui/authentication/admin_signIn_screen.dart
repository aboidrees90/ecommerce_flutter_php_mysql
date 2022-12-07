import 'package:ecommerce_php/controller/admin_sign_in_controller.dart';
import 'package:ecommerce_php/ui/widgets/auth_screen_head.dart';
import 'package:ecommerce_php/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSignInScreen extends StatelessWidget {
  AdminSignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _isObscure = true.obs;

  @override
  Widget build(BuildContext context) {
    final AdminSignInController controller = Get.put(AdminSignInController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, cons) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: cons.maxHeight),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Sing In screen header
                    AuthScreenHead(height: height, width: width, imageUrl: "images/admin.jpg"),

                    // Sing In Screen signin form
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26, offset: Offset(0, -3))],
                      ),
                      child: Column(
                        children: [
                          const Center(child: Text("Sign in as an Admin", style: TextStyle(fontSize: 20, color: Colors.white))),
                          const SizedBox(height: 36),
                          // Email/Password sing In - form
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Email
                                TextFormField(
                                  controller: controller.email,
                                  validator: (value) => value == "" ? "Please write an email" : null,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email, color: Colors.black),
                                    hintText: "Email ...",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: Colors.white60),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: Colors.white60),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: Colors.white60),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: Colors.white60),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),

                                const SizedBox(height: 15),

                                // Password
                                Obx(
                                  () => TextFormField(
                                    controller: controller.password,
                                    validator: (value) => value == "" ? "Please write password" : null,
                                    obscureText: _isObscure.value,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.vpn_key_sharp, color: Colors.black),
                                      hintText: "Password ...",
                                      suffixIcon: Obx(
                                        () => GestureDetector(
                                          onTap: () => _isObscure.value = !_isObscure.value,
                                          child: Icon(_isObscure.value ? Icons.visibility_off : Icons.visibility, color: Colors.black),
                                        ),
                                      ),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        borderSide: BorderSide(color: Colors.white60),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        borderSide: BorderSide(color: Colors.white60),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        borderSide: BorderSide(color: Colors.white60),
                                      ),
                                      disabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        borderSide: BorderSide(color: Colors.white60),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 18),

                                // Button
                                Button(
                                  text: "Sing In",
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) await controller.signIn();
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          // Don't have an account button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Not an admin?", style: TextStyle(color: Colors.grey, fontSize: 14)),
                              TextButton(
                                onPressed: controller.goToSignIn,
                                child: const Text("Go back to Sign In", style: TextStyle(color: Colors.white, fontSize: 16)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
