import 'package:chatty/common/routes/names.dart';
import 'package:chatty/pages/message/state.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  MessageController();

  final state = MessageState();

  void goProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }

  void goContact() async{
    await Get.toNamed(AppRoutes.Contact);
  }
}
