// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mom_pulse_app/modules/layout/pages/setting/notifications/cubit/notification_cubit.dart';
// import 'package:mom_pulse_app/modules/layout/pages/setting/notifications/cubit/notification_state.dart';
//
// class TimeNotificationScreen extends StatelessWidget {
//   const TimeNotificationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => TimeCubit()..loadSavedTime(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('تنبيه يومي'),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ),
//         body: const TimeNotificationBody(),
//       ),
//     );
//   }
// }
//
// class TimeNotificationBody extends StatelessWidget {
//   const TimeNotificationBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TimeCubit, TimeState>(
//       builder: (context, state) {
//         if (state is TimeLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is TimeLoaded) {
//           final selectedTime = state.time;
//           final formatted = selectedTime.format(context);
//
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Text('الوقت الحالي للتنبيه: $formatted',
//                     style: const TextStyle(fontSize: 18)),
//
//                 const SizedBox(height: 20),
//
//                 ElevatedButton.icon(
//                   icon: const Icon(Icons.access_time),
//                   label: const Text('اختيار وقت جديد'),
//                   onPressed: () async {
//                     final TimeOfDay? newTime = await showTimePicker(
//                       context: context,
//                       initialTime: selectedTime,
//                     );
//                     if (newTime != null) {
//                       context.read<TimeCubit>().updateTime(newTime);
//                     }
//                   },
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 ElevatedButton.icon(
//                   icon: const Icon(Icons.notifications_active),
//                   label: const Text('حفظ الوقت و تفعيل التنبيه'),
//                   onPressed: () {
//                     context.read<TimeCubit>().saveTimeAndSchedule();
//                   },
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return const Center(child: Text('حدث خطأ في تحميل الوقت'));
//         }
//       },
//     );
//   }
// }
