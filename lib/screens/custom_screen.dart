import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:twilio_demo/screens/custom_controller.dart';

class CustomScreen extends StatelessWidget {
  CustomScreen({Key? key}) : super(key: key);

  final _controller = Get.find<CustomController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call'),
      ),
      body: Obx(
        ()=> Stack(
          children: [
            Center(
                  child:_remoteVideo()

            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 100,
                height: 150,
                child: Center(
                  child: _controller.localUserJoined.value
                      ? RtcLocalView.SurfaceView()
                      : CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_controller.isRemoteJoined.value) {
      return RtcRemoteView.SurfaceView(uid: _controller.remoteUid!,channelId: "test",);
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
