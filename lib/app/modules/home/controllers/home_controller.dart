import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxInt selectedCategory = 0.obs;
  final RxInt cartCount = 1.obs;
  final RxDouble cartTotal = 2.40.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
