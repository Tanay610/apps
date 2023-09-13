import 'package:chatty/pages/frame/welcome/controller.dart';
import 'package:chatty/pages/message/controller.dart';
import 'package:get/get.dart';

class MessageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MessageController>(() => MessageController());
  }
}