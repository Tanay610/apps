import 'package:chatty/pages/profile/index.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}