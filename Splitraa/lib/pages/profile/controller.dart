import 'package:chatty/common/routes/names.dart';
import 'package:chatty/pages/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user.dart';

class ProfileController extends GetxController {
  ProfileController();
  final title = "Splitra";
  final state = ProfileState();



  Future<void> goLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
