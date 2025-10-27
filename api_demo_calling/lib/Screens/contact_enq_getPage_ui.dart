import 'package:api_demo_calling/Controllers/contact_enq_get_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class EnquiryListScreen extends StatelessWidget {
  final ContactEnqGetController controller = Get.find<ContactEnqGetController>();

  EnquiryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Enquiries',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: SpinKitFadingCircle(color: Colors.teal));
        }
        // if (controller.Getconenqi.isEmpty) {
        //   return const Center(child: Text("No Data Found"));
        // }
        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchContactEnq();
          },
          child:
              controller.Getconenqi.isEmpty
                  ? ListView(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Center(child: Text("No Data Found")),
                      ),
                    ],
                  )
                  : ListView.builder(
                    itemCount: controller.Getconenqi.length,
                    itemBuilder: (context, index) {
                      final conenq = controller.Getconenqi[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name & Email
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Name: ${conenq.name}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          'Status: ${conenq.status}',
                                          style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Email: ${conenq.email}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Phone: ${conenq.phone}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Service: ${conenq.service}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Details: ${conenq.details}',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
        );
      }),
    );
  }
}
