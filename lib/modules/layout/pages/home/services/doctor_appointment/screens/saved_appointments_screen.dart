import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/models/doctor_appointment_model.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedAppointmentsScreen extends StatefulWidget {
  const SavedAppointmentsScreen({super.key, });

  @override
  State<SavedAppointmentsScreen> createState() => _SavedAppointmentsScreenState();
}

class _SavedAppointmentsScreenState extends State<SavedAppointmentsScreen> {
  List<DoctorAppointment> appointments = [];

  @override
  void initState() {
    super.initState();
    loadAppointments();
  }

  void loadAppointments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> data = prefs.getStringList('appointments') ?? [];

    List<DoctorAppointment> loaded = [];
    for (var item in data) {
      loaded.addAll(DoctorAppointment.decode(item));
    }

    setState(() {
      appointments = loaded;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Saved Appointments",
        backRoute: AppRoutesName.doctorScreen,
      ),
      body: appointments.isEmpty
      ?const Center(child: Text("No appointments yet"),)
      :ListView.separated(
        itemCount: appointments.length,
          itemBuilder: (context, index){
          final item = appointments[index];
          return ListTile(
            title: Text(
                item.doctorName,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
            subtitle: Text(
                item.description,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
            ),
            trailing: Text(
                '${item.date.day}/${item.date.month} - ${item.time}',
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            ),
          );
          },
        separatorBuilder: (context,index)=> const Divider(
          color: AppColors.grey,
          thickness: 1,
          indent: 26,
          endIndent: 26,
        ),
      ),
    );
  }
}
