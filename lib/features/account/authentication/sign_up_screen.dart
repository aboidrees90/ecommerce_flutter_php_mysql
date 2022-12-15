import 'package:ecommerce_php/controller/sign_up_controller.dart';
import 'package:ecommerce_php/core/functions/input_style.dart';
import 'package:ecommerce_php/features/widgets/auth_screen_head.dart';
import 'package:ecommerce_php/features/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _isObscure = true.obs;

  final SignUpController _controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
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
                    // Sign up screen header
                    AuthScreenHead(height: height, width: width, imageUrl: "images/sign_up.jpg"),

                    // Sign in screen signin form
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
                          const Center(child: Text("Sign Up", style: TextStyle(fontSize: 20, color: Colors.white))),
                          const SizedBox(height: 36),

                          // Email/Password sign up - form
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  controller: _controller.email,
                                  validator: (value) => value == "" ? "Please write an email" : null,
                                  decoration: inputStyle(hintText: "Email ...", prefixIconData: Icons.email),
                                ),

                                const SizedBox(height: 15),

                                // Password
                                Obx(
                                  () => TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    controller: _controller.password,
                                    validator: (value) => value == "" ? "Please write password" : null,
                                    obscureText: _isObscure.value,
                                    decoration: inputStyle(
                                      hintText: "Password ...",
                                      prefixIconData: Icons.vpn_key_sharp,
                                      suffixIcon: Obx(
                                        () => GestureDetector(
                                          onTap: () => _isObscure.value = !_isObscure.value,
                                          child: Icon(_isObscure.value ? Icons.visibility_off : Icons.visibility, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 18),

                                // Button
                                Button(
                                  text: "Sign up",
                                  textSize: 16.0,
                                  padding: const EdgeInsets.all(4),
                                  onTap: () async => (_formKey.currentState!.validate()) ? await _controller.signUp() : null,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          // Don't have an account button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?", style: TextStyle(color: Colors.grey, fontSize: 14)),
                              TextButton(
                                onPressed: _controller.goToSignIn,
                                child: const Text("Sign in from here", style: TextStyle(color: Colors.white, fontSize: 16)),
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
