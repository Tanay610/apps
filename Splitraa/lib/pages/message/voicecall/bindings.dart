import 'package:chatty/pages/frame/welcome/controller.dart';
import 'package:chatty/pages/message/voicecall/controller.dart';
import 'package:get/get.dart';

class VoiceCallBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<VoiceCallController>(() => VoiceCallController());
  }
}