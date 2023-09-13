import 'dart:convert';

import 'package:chatty/common/apis/user.dart';
import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/common/routes/routes.dart';
import 'package:chatty/common/utils/http.dart';
import 'package:chatty/common/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../common/store/user.dart';
import 'index.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["openid"]);

  Future<void> handleSignin(String type) async {
    /// 1:email 2:google, 3: facebook, 4: apple, 5: phone
    try {
      if (type == "Phone Number") {
        if (kDebugMode) {
          print("... you are logging in with Phone Number ...");
        }
      } else if (type == "google") {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          final _gAuthentication = await user.authentication;
          final _crdential = GoogleAuthProvider.credential(
              idToken: _gAuthentication.idToken,
              accessToken: _gAuthentication.accessToken);

          await FirebaseAuth.instance.signInWithCredential(_crdential);

          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? "assets/icons/google.png";
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.type = 2;
          print(jsonEncode(loginPanelListRequestEntity));
          asyncPostAllData(loginPanelListRequestEntity);
        }
      } else {
        if (kDebugMode) {
          print("...login type not sure...");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('...error with login $e');
      }
    }
  }

  asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    /*
    first save in the database
    second save in the local storage
      */

    // var response = await HttpUtil().get('/api/index');
    // print(response);

    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    var result = await UserAPI.Login(params: loginRequestEntity);
    // UserStore.to.setisLogin = true;
    if (result.code == 0) {
      await UserStore.to.saveProfile(result.data!);
      EasyLoading.dismiss();
      toastInfo(msg: "Internet error");
    }
    Get.offAllNamed(AppRoutes.Message);
  }
}
