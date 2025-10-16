import 'dart:convert';

import 'package:api_demo_calling/Models/contact_enq_model_get.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ContactEnqGetController extends GetxController {

     var Getconenqi = <Data>[].obs;
     var isLoading = true.obs;
     String? token;

      @override
      void onInit() {
        fetchContactEnq();
        super.onInit();
      }

     Future<void> fetchContactEnq() async {
      final prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");
      try {
        isLoading(true);

        final response = await http.get(Uri.parse('https://marketing-web-server.vercel.app/api/v1/service-enquiries'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
        );
        if(response.statusCode == 200) {
          var jsonData  = jsonDecode(response.body);
          List<dynamic> data = jsonData['data'];
          Getconenqi.value = data.map((e)=> Data.fromJson(e)).toList();
        }
        }catch (e) {
            print("Error fetching data: $e");
        }finally {
          isLoading(false);
        }

      }
     }
     
