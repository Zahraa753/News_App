import 'package:docdoc/core/styles/colors.dart';
import 'package:docdoc/pages/doctors_detail/logic/doctor_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetailsAbout extends StatelessWidget {
  const DoctorDetailsAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<DoctorDetailsProvider>();
    final doctor = provider.doctor!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorCore.cl1,
          ),
        ),
        Text(
          doctor.description,
          style: TextStyle(fontSize: 14, color: ColorCore.cl1),
        ),
        SizedBox(height: 10),
        Text(
          'Email',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorCore.cl1,
          ),
        ),
        Text(
          doctor.email,
          style: TextStyle(fontSize: 14, color: ColorCore.cl1),
        ),
        SizedBox(height: 10),
        Text(
          'Phone Number',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorCore.cl1,
          ),
        ),
        Text(
          doctor.phone,
          style: TextStyle(fontSize: 14, color: ColorCore.cl1),
        ),
        SizedBox(height: 10),
        Text(
          'Working Time',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorCore.cl1,
          ),
        ),
        Text(
          '${doctor.startTime} - ${doctor.endTime}',
          style: TextStyle(fontSize: 14, color: ColorCore.cl1),
        ),
        SizedBox(height: 10),
        Text(
          'Appoint Price',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorCore.cl1,
          ),
        ),
        Text(
          '${doctor.appointPrice} EGP',
          style: TextStyle(fontSize: 14, color: ColorCore.cl1),
        ),
      ],
    );
  }
}
