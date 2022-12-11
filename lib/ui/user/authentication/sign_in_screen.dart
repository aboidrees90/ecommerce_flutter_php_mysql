import 'package:ecommerce_php/controller/sign_in_controller.dart';
import 'package:ecommerce_php/ui/widgets/auth_screen_head.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _isObscure = true.obs;
  final SignInController _controller = Get.put(SignInController());

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
                    // Sing In screen header
                    AuthScreenHead(height: height, width: width, imageUrl: "images/sign_in.jpg"),

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
                          const Center(child: Text("Sign In", style: TextStyle(fontSize: 20, color: Colors.white))),
                          const SizedBox(height: 36),

                          // Email/Password sing In - form
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Email
                                TextFormField(
                                  controller: _controller.email,
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
                                    controller: _controller.password,
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
                                Material(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                  child: InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) await _controller.signIn();
                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                                      child: Text("Sing In", style: TextStyle(color: Colors.white, fontSize: 14)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          // Don't have an account button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 14)),
                              TextButton(
                                onPressed: _controller.goToSignUp,
                                child: const Text("Sign up from here", style: TextStyle(color: Colors.white, fontSize: 16)),
                              ),
                            ],
                          ),
                          const Text("OR", style: TextStyle(color: Colors.grey)),
                          // Are you an admin? - Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Are you an admin?", style: TextStyle(color: Colors.grey, fontSize: 14)),
                              TextButton(
                                onPressed: _controller.goToAdminSignIn,
                                child: const Text("Click here", style: TextStyle(color: Colors.white, fontSize: 16)),
                              ),
                            ],
                          )
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
