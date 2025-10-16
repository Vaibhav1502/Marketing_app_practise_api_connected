
import 'package:api_demo_calling/Screens/contact_enq_ui.dart';
import 'package:api_demo_calling/Screens/splash_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';



void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
    );
  }
}



// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String? token;
//   String apiResponse = "";

//   @override
//   void initState() {
//     super.initState();
//     getTokenAndFetchData();
//   }

//   Future<void> getTokenAndFetchData() async {
//     final prefs = await SharedPreferences.getInstance();
//     token = prefs.getString("token");

//     if (token != null) {
//       final response = await http.get(
//         Uri.parse("https://marketing-web-server.vercel.app/api/v1/service-enquiries"),
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token",
//         },
//       );

//       setState(() {
//         apiResponse = response.body;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Home")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           apiResponse.isEmpty
//               ? "Loading data..."
//               : "Response:\n\n$apiResponse",
//         ),
//       ),
//     );
//   }
// }