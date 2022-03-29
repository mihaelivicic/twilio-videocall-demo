import 'package:agora_uikit/agora_uikit.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// --
  ///
  ///

  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      tempToken: "00666d7255f958c4ff3a4e67d7c39c1856cIADyS+Eib8pZbcOqcLM9VEgG44ZFvgEPVHCpImz1WsKz0gx+f9gAAAAAEAAJmhJvbi1EYgEAAQBuLURi",
      //tempToken: "00666d7255f958c4ff3a4e67d7c39c1856cIACQIE7br/R4a0+PeLttavxFZaj6gr6Sn1hrzjzxwSA0xQx+f9gAAAAAEAAJmhJvLS5EYgEAAQAtLkRi",
      appId: "66d7255f958c4ff3a4e67d7c39c1856c",
      channelName: "test",
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  /// ------------------------
  /// GETTERS
  /// ------------------------

  /// ------------------------
  /// SETTERS
  /// ------------------------

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initAgora();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  void initAgora() async {
    await client.initialize();
  }
}
