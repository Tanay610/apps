import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:chatty/common/routes/names.dart';
import 'package:chatty/common/store/user.dart';
import 'package:chatty/common/values/server.dart';
import 'package:chatty/pages/frame/welcome/state.dart';
import 'package:chatty/pages/message/voicecall/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class VoiceCallController extends GetxController {
  VoiceCallController();

  final state = VoiceCallState();
  final player = AudioPlayer();
  String appId = APPID;
  final db = FirebaseFirestore.instance;
  final profiletoken = UserStore.to.profile.token;
  late final RtcEngine engine;

  /// it takes time to create your your own rtc engine

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;

    /// good method over onready,
    state.to_name.value = data["to_name"] ?? "";
    state.to_avatar.value = data["to_avatar"] ?? "";
    print("...your name id ${state.to_name.value}");
  }

  Future<void> initEngine() async {
    await player.setAsset("assets/Sound_Horizon.mp3");

    engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(appId: appId,
    ),
    );
  }
}
