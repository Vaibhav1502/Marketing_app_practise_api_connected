import 'package:api_demo_calling/Screens/bottom_nav_bar.dart';
import 'package:api_demo_calling/Screens/login_ui.dart';
import 'package:api_demo_calling/bindings/main_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    await Future.delayed(const Duration(seconds: 2)); // small splash delay

    if (token != null && token.isNotEmpty) {
      // ✅ Token mil gaya → direct home
      Get.offAll(()=> BottomNavExample(), binding: MainBinding());
    } else {
      // ❌ Token nahi mila → login dikha
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Checking Token From Storage..."),
            SizedBox(height: 20),
            SpinKitFadingCircle(color: Colors.teal),
          ],
        ),
        ),
    );
  }
}
