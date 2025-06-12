import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/service/notification_service.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/authentication/widget/custom_text_form_field.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/models/doctor_appointment_model.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/widget/custom_floating_btn.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/widget/date_picker_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/widget/time_picker_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController descriptionController  = TextEditingController();
  List<DoctorAppointment> appointments = [];

  void saveAppointment() async {
    if (doctorNameController.text.isEmpty || descriptionController.text.isEmpty || selectedDate == null || selectedTime == null) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existing = prefs.getStringList('appointments') ?? [];

    DoctorAppointment newAppointment = DoctorAppointment(
      doctorName: doctorNameController.text,
      description: descriptionController.text,
      date: selectedDate!,
      // ignore: use_build_context_synchronously
      time: selectedTime!.format(context),
    );

    existing.add(json.encode(newAppointment.toMap()));
    await prefs.setStringList('appointments', existing);
    print("Saved appointments: $existing");
    NotificationService.scheduleDoctorAppointment(newAppointment);

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRoutesName.savedAppointmentsScreen);
    if (doctorNameController.text.isEmpty || descriptionController.text.isEmpty || selectedDate == null || selectedTime == null) {
      print("⚠️ Missing data, not saving appointment");
      return;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Doctor Appointment",
        backRoute: AppRoutesName.layoutScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Doctor Name",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              CustomTextFormField(
                controller: doctorNameController,
                color: AppColors.mentGreen,
                prefixIcon: const Icon(
                    Icons.edit_calendar,
                  color: AppColors.mentGreen,
                ) ,
                hintText: "Event Title",
                hintStyle: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 25,),
              Text(
                "Description",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 150,
                child: CustomTextFormField(
                  controller: descriptionController,
                  color: AppColors.mentGreen,
                  prefixIcon: const Icon(
                    Icons.description,
                    color: AppColors.mentGreen,
                  ) ,
                  hintText: "Event Description ",
                  hintStyle: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 30,),
              DatePickerWidget(
                selectedDate: selectedDate,
                onDateSelected: (date){
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              const SizedBox(height: 25,),
               TimePickerWidget(
                selectedTime: selectedTime,
                 onTimeSelected: (time){
                  setState(() {
                    selectedTime = time;
                  });
                 },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:  CustomFloatingBtn(
        onPressed: saveAppointment,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
