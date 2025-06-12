
import 'package:mom_pulse_app/modules/layout/mic/mic_detection/model/prediction_result_model.dart';

abstract class MicState {}

class MicInitial extends MicState {}

class MicLoading extends MicState {}

class MicSuccess extends MicState {
  final PredictionResult prediction;
  MicSuccess({required this.prediction});
}

class MicError extends MicState {
  final String message;
  MicError(this.message);
}
