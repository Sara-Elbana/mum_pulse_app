import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:lottie/lottie.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late VlcPlayerController _vlcController;

  final String streamUrl = ''; //  'rtsp://192.168.1.100:554/stream'

  @override
  void initState() {
    super.initState();
    _vlcController = VlcPlayerController.network(
      streamUrl,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() {
    _vlcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Camera",
        showActions: false,
        backRoute: AppRoutesName.layoutScreen,
      ),
      body: streamUrl.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.cameraAnimation1,
              width: 200,
              height: 200,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    const ['**', 'wave_2 Outlines', '**'],
                    value: const Color(0xFFD3EDEB),
                  ),
                  ValueDelegate.color(
                    const ['**', 'wave_1 Outlines', '**'],
                    value: const Color(0xFFD3EDEB),
                  ),
                  ValueDelegate.color(
                    const ['**', 'speaker Outlines', '**'],
                    value: const Color(0xFFD3EDEB),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          : Center(
        child: VlcPlayer(
          controller: _vlcController,
          aspectRatio: 16/9,
          placeholder: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
