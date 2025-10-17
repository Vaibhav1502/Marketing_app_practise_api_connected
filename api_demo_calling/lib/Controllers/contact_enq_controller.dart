import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactenqController extends GetxController {
  final namecontroller = TextEditingController().obs;
  final emailcontroller = TextEditingController().obs;
  final phonecontroller = TextEditingController().obs;
  final servicecontroller = TextEditingController().obs;
  final detailcontroller = TextEditingController().obs;
  final statuscontroller = TextEditingController().obs;

  RxBool loading = false.obs;
  

  void clearForm() {
    namecontroller.value.clear();
    emailcontroller.value.clear();
    phonecontroller.value.clear();
    servicecontroller.value.clear();
    detailcontroller.value.clear();
    statuscontroller.value.clear();
  }

  Future<void> enqApi() async {
    loading.value = true;
    try {
      final response = await http.post(
        Uri.parse(
          'https://marketing-web-server.vercel.app/api/v1/service-enquiries',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': namecontroller.value.text,
          'email': emailcontroller.value.text,
          'phone': phonecontroller.value.text,
          'service': servicecontroller.value.text,
          'details': detailcontroller.value.text,
          'status': statuscontroller.value.text,
        }),
      );

      var data = jsonDecode(response.body);
      // print(response.statusCode);
      // print(data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        loading.value = false;
        Get.snackbar("Data added successfully", 'Congratulations');
        clearForm();
      } else {
        loading.value = false;
        Get.snackbar("Failed to add data", data['error']);
      }
    } catch (e) {
      Get.snackbar(
        "Exception",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    }
  }
}
