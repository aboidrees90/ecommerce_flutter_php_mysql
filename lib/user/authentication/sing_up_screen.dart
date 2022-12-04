import 'package:ecommerce_php/user/authentication/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  var isObscure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: cons.maxHeight),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Sign up screen header
                  SizedBox(width: MediaQuery.of(context).size.width, height: 285, child: Image.asset("images/sign_up.jpg")),

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
                        // Email/Password sign up - form
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              // Name
                              TextFormField(
                                controller: _name,
                                validator: (value) => value == "" ? "Please write a name" : null,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person, color: Colors.black),
                                  hintText: "Full name ...",
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
                              // Email
                              TextFormField(
                                controller: _email,
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
                                  controller: _password,
                                  validator: (value) => value == "" ? "Please write password" : null,
                                  obscureText: isObscure.value,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.vpn_key_sharp, color: Colors.black),
                                    hintText: "Password ...",
                                    suffixIcon: Obx(
                                      () => GestureDetector(
                                        onTap: () => isObscure.value = !isObscure.value,
                                        child: Icon(isObscure.value ? Icons.visibility_off : Icons.visibility, color: Colors.black),
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
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                                    child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 14)),
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
                            const Text("Already have an account?", style: TextStyle(color: Colors.grey, fontSize: 14)),
                            TextButton(
                              onPressed: () => Get.to(() => const SingInScreen()),
                              child: const Text("Sign in here", style: TextStyle(color: Colors.white, fontSize: 16)),
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
    );
  }
}
