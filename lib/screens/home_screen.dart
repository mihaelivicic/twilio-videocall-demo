import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twilio_demo/screens/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          AgoraVideoViewer(
            layoutType: Layout.grid,
            floatingLayoutContainerWidth: Get.width,
            floatingLayoutContainerHeight: Get.height,
            client: _controller.client,
          ),
          AgoraVideoButtons(
            client: _controller.client,
            autoHideButtons: true,
            enabledButtons: const [BuiltInButtons.callEnd,BuiltInButtons.switchCamera],

          ),
        ],
      ),
    ));
  }
}
