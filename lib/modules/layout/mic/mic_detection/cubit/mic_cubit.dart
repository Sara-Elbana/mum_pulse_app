import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_pulse_app/modules/layout/mic/mic_detection/model/prediction_result_model.dart';
import 'mic_state.dart';

class MicCubit extends Cubit<MicState> {
  MicCubit(this._repo) : super(MicInitial());
  final dynamic _repo;

  void startListening() {
    emit(MicLoading());

    Future.delayed(const Duration(seconds: 5), () {
      final labels = ['baby is hungry', 'baby feels discomfort', 'baby has belly pain'];
      final random = Random();
      final label = labels[random.nextInt(labels.length)];
      final confidence = 70 + random.nextDouble() * 30;

      final fakePrediction = PredictionResult(
        label: label,
        confidence: confidence,
      );
      emit(MicSuccess(prediction: fakePrediction));
    });
  }
}




































// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mom_pulse_app/modules/layout/mic/mic_detection/repository/mic_repository.dart';
// import 'mic_state.dart';
//
// class MicCubit extends Cubit<MicState> {
//   final MicRepository micRepository;
//
//   MicCubit(this.micRepository) : super(MicInitial());
//
//   Future<void> startListening() async {
//     emit(MicLoading());
//
//     try {
//       final prediction = await micRepository.detectCry();
//       emit(MicSuccess(prediction));
//     } catch (e) {
//       emit(MicError(e.toString()));
//     }
//   }
// }
