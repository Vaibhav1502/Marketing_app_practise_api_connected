import 'package:api_demo_calling/Controllers/enq_controller.dart';
import 'package:api_demo_calling/Screens/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Servicenq extends StatelessWidget {
  final Servicenqcontroller controller = Get.put(Servicenqcontroller());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Servicenq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Service Enquiry',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear(); // Good for locally logout
              Get.offAll(LoginScreen());
            },
            icon: Icon(Icons.logout, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: Obx(() {

        if (controller.isLoading.value) {
          return const Center(child: SpinKitFadingCircle(color: Colors.teal));
        }
        // if (controller.serviceenq.isEmpty) {
        //   return const Center(child: Text("No Data Found"));
        // }
        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchServiceEnq();
          },
          child:
              controller.serviceenq.isEmpty
                  ? ListView(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Center(child: Text("No Data Found")),
                      ),
                    ],
                  )
                  : ListView.builder(
                    itemCount: controller.serviceenq.length,
                    itemBuilder: (context, index) {
                      final enq = controller.serviceenq[index];
                      return Card(
                        margin: EdgeInsets.all(08),
                        child: ListTile(
                          title: Text("Name: ${enq.name}"),
                          subtitle: Text("Email: ${enq.email}"),
                        ),
                      );
                    },
                  ),
        );
      }),
    );
  }
}
