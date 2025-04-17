import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/doctor_appointment/widget/custom_floating_btn.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/widget/app_bar_services_widget.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/emergency_call/models/emergency_contact_model.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/emergency_call/widget/add_contact_dialog.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/emergency_call/widget/contact_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyCallScreen extends StatefulWidget {
  const EmergencyCallScreen({super.key});

  @override
  State<EmergencyCallScreen> createState() => _EmergencyCallScreenState();
}

class _EmergencyCallScreenState extends State<EmergencyCallScreen> {
  List<EmergencyContact> contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactListJson = prefs.getStringList('emergencyContacts') ?? [];
    setState(() {
      contacts = contactListJson
          .map((jsonStr) => EmergencyContact.fromJson(json.decode(jsonStr)))
          .toList();
    });
  }

  Future<void> _saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = contacts.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('emergencyContacts', jsonList);
  }

  void _addContact(EmergencyContact contact) {
    setState(() {
      contacts.add(contact);
    });
    _saveContacts();
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  void _openAddContactDialog() {
    showDialog(
      context: context,
      builder: (context) => AddContactDialog(onAdd: _addContact),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarServicesWidget(
        title: "Emergency Call",
        backRoute: AppRoutesName.settingScreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ContactCardWidget(
              contact: contact,
              onCall: () => _makePhoneCall(contact.phone),
            );
          },
        ),
      ),
      floatingActionButton: CustomFloatingBtn(
        onPressed: _openAddContactDialog,
      ),
    );
  }
}
