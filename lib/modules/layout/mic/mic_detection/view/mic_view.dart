import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import '../cubit/mic_cubit.dart';
import '../cubit/mic_state.dart';

class MicView extends StatelessWidget {
  const MicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
              title: "Baby Cry Detector",
              showActions: false,
            ),
      body: Center(
        child: BlocBuilder<MicCubit, MicState>(
          builder: (context, state) {
            if (state is MicLoading) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pulse(
                    infinite: true,
                    child: const Icon(Icons.mic, size: 80, color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  const Text("Listening...", style: TextStyle(fontSize: 18)),
                ],
              );
            } else if (state is MicSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, size: 80, color: Colors.green),
                  const SizedBox(height: 16),
                  Text(
                    "Detected: ${state.prediction.label}\nConfidence: ${state.prediction.confidence.toStringAsFixed(1)}%",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              );
            } else if (state is MicError) {
              return Text("Error: ${state.message}");
            }

            return GestureDetector(
              onTap: () => context.read<MicCubit>().startListening(),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mic_none, size: 80, color: Colors.blue),
                  SizedBox(height: 16),
                  Text("Tap to Start Recording", style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
