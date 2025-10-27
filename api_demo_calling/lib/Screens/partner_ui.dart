import 'package:api_demo_calling/Controllers/partner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PartnerUi extends StatelessWidget {
  final PartnerController controller = Get.find<PartnerController>();
  PartnerUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Partners",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: SpinKitFadingCircle(color: Colors.teal));
        }
        // if (controller.partners.isEmpty) {
        //   return const Center(child: Text("No Data Found"));
        // }
        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchPartner();
          },
          child:
              controller.partnr.isEmpty
                  ? ListView(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Center(child: Text("No Data Found")),
                      ),
                    ],
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: controller.partnr.length,
                    itemBuilder: (context, index) {
                      final partner = controller.partnr[index];
                      return Card(
              
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Partner Name
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${partner.partnerName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      '${partner.status}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    backgroundColor: Colors.redAccent,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Bank Info
                              Text(
                                'Bank: ${partner.bank}',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Branch: ${partner.branch}',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Loan Info
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Loan: ${partner.loanType}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${partner.loanAmount}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Disclosure Date
                              Text(
                                'Disclosure Date: ${partner.disclosmentDate}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        );
      }),
    );
  }
}
