// ignore_for_file: use_build_context_synchronously

import 'package:api_demo_calling/Screens/bottom_nav_bar.dart';
import 'package:api_demo_calling/bindings/main_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  // 🔹 Simple login function
  Future<void> login() async {
    setState(() => isLoading = true);

    final response = await http.post(
      Uri.parse('https://marketing-web-server.vercel.app/api/v1/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data["token"];

      // Save token locally
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      Get.snackbar(
        "Login",
        "Login Successful ✅",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        
      );

      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(const SnackBar(content: Text("Login Successful 😘")));

      Get.offAll(() => BottomNavExample(), binding: MainBinding());

      // Go to next screen
      // Navigator.push(context, MaterialPageRoute(builder: (_) => BottomNavExample()));
    } else {
      Get.snackbar("Login", "Login Failed 😢",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(const SnackBar(content: Text("Login Failed ❌")));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.red,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Image.asset(
                "assets/logo-new.png",
                // width: 200,
                // height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 60),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              
              const SizedBox(height: 50),
              isLoading
                  ? SpinKitFadingCircle(color: Colors.red)
                  : SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: login,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
