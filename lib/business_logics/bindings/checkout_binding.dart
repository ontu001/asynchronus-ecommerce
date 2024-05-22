import 'package:ecommerce/business_logics/controllers/checkout_controller.dart';
import 'package:get/get.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutController());
  }
}
