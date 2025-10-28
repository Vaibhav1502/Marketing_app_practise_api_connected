import 'package:api_demo_calling/Controllers/blog_controller.dart';
import 'package:api_demo_calling/Controllers/contact_enq_get_controller.dart';
import 'package:api_demo_calling/Controllers/enq_controller.dart';
import 'package:api_demo_calling/Controllers/partner_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {

      // Use lazyPut to create the controller only when it's first needed.
    //Get.lazyPut<Servicenqcontroller>(() => Servicenqcontroller());
    Get.lazyPut<ContactEnqGetController>(() => ContactEnqGetController());
    Get.lazyPut<BlogController>(() => BlogController());
    // Note: ContactenqController for the POST request can be put normally
    // if you want it ready on the contact page, or lazyPut as well.
    // Get.lazyPut<ContactenqController>(() => ContactenqController());
    Get.lazyPut<PartnerController>(() => PartnerController());
    
  }

}