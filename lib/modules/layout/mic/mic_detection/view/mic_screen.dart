import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/mic/mic_detection/cubit/mic_state.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import '../cubit/mic_cubit.dart';
import '../repository/mic_repository.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';


class MicScreen extends StatefulWidget {
  const MicScreen({super.key});

  @override
  State<MicScreen> createState() => _MicScreenState();
}

class _MicScreenState extends State<MicScreen> {
  late final RecorderController _recorderController;

  @override
  void initState() {
    super.initState();
    _recorderController = RecorderController();
  }

  @override
  void dispose() {
    _recorderController.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    await _recorderController.record(); // start recording with waveform
  }

  Future<void> _stopRecording() async {
    await _recorderController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MicCubit(MicRepository()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const AppBarServicesWidget(
          title: "Baby Cry Detector",
          showActions: false,
          backRoute: AppRoutesName.layoutScreen,
        ),
        body: Center(
          child: BlocBuilder<MicCubit, MicState>(
            builder: (context, state) {
              if (state is MicLoading) {
                _startRecording();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD3EDEB),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Center(
                        child: AudioWaveforms(
                          enableGesture: false,
                          size: const Size(double.infinity, 100),
                          recorderController: _recorderController,
                          waveStyle: const WaveStyle(
                            waveColor: AppColors.black,
                            extendWaveform: true,
                            showMiddleLine: false,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                     Text("Listening...", style: GoogleFonts.inter(
                        fontSize: 25, fontWeight: FontWeight.w600),),
                  ],
                );
              } else if (state is MicSuccess) {
                _stopRecording();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Icon(Icons.check_circle, size: 80, color: AppColors.darkGreen),
                    const SizedBox(height: 16),
                    Text(
                      "Detected: ${state.prediction.label}\nConfidence: ${state.prediction.confidence.toStringAsFixed(1)}%",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                );
              } else if (state is MicError) {
                _stopRecording();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 80, color: Colors.red),
                    const SizedBox(height: 16),
                    Text("Error: ${state.message}", style: GoogleFonts.inter(
                        fontSize: 25, fontWeight: FontWeight.w600),),
                  ],
                );
              }

              return GestureDetector(
                onTap: () => context.read<MicCubit>().startListening(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD3EDEB),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                    child: Center(
                      child: Image.asset(
                        AppAssets.voiceWave1,
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ),
                    const SizedBox(height: 16),
                     Text("Tap to Start Recording", style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w600),),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
