import 'dart:developer';

import 'package:get/get.dart';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "66d7255f958c4ff3a4e67d7c39c1856c";
const token = "00666d7255f958c4ff3a4e67d7c39c1856cIAARZmEkK/sYSF6c9TQ5nFwWMVX6ZT2arhcGa+G4PoIrmQx+f9gAAAAAEADJZeRXhutLYgEAAQCF60ti";

class CustomController extends GetxController{

  late RtcEngine engine;

  var localUserJoined = false.obs;
  int? remoteUid;
  var isRemoteJoined = false.obs;

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    engine = await RtcEngine.create(appId);
    await engine.enableVideo();

    engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
            localUserJoined.value = true;
            log("!!!!!!!!!!!!!!!!!!!");
            log("Local user has joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          log("!!!!!!!!!!!!!!!!!!!");
          log("Remote user has joined");
          isRemoteJoined.value = true;
          remoteUid = uid;

          log("Remote user has joined ${remoteUid}");
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
            remoteUid = null;
            isRemoteJoined.value = false;
        },
      ),
    );

    await engine.joinChannel(token, "test", null, 0);
  }

  @override
  void onInit() async {
    super.onInit();
    await initAgora();

  }
}