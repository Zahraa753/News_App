import 'package:docdoc/core/styles/colors.dart';
import 'package:docdoc/pages/doctors_detail/logic/doctor_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetailsLocation extends StatelessWidget {
  const DoctorDetailsLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<DoctorDetailsProvider>();
    final doctor = provider.doctor!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorCore.cl1,
          ),
        ),
        Text(
          doctor.address,
          style: TextStyle(fontSize: 14, color: ColorCore.cl1),
        ),
        SizedBox(height: 10),
        Text(
          'City',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorCore.cl1,
          ),
        ),
        Text(
          doctor.city.name,
          style: TextStyle(fontSize: 14, color: ColorCore.cl1),
        ),
        SizedBox(height: 10),
        Text(
          'Governorate',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorCore.cl1,
          ),
        ),
        Text(
          doctor.city.governrate.name,
          style: TextStyle(fontSize: 14, color: ColorCore.cl1),
        ),
      ],
    );
  }
}
