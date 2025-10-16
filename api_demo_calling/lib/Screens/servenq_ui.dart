import 'package:api_demo_calling/Controllers/enq_controller.dart';
import 'package:api_demo_calling/Screens/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';


class Servicenq extends StatelessWidget {
  final Servicenqcontroller controller = Get.put(Servicenqcontroller());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Servicenq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Service Enquiry',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(LoginScreen());
            },
            icon: const Icon(Icons.logout, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          // 🔹 Show shimmer while loading
          return ListView.builder(
            itemCount: 8, // number of shimmer items
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Container(
                        height: 16,
                        width: 100,
                        color: Colors.white,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            height: 14,
                            width: 150,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }

        // 🔹 When data is loaded
        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchServiceEnq();
          },
          child: controller.serviceenq.isEmpty
              ? ListView(
                  children: const [
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
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
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
