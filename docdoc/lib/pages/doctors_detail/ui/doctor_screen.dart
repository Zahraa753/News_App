import 'package:docdoc/pages/Home/models/doctors_modle';
import 'package:docdoc/pages/doctors_detail/logic/doctor_logic.dart';
import 'package:docdoc/pages/doctors_detail/ui/doctor_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctorModel;
  const DoctorDetailsScreen({Key? key, required this.doctorModel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          DoctorDetailsProvider()..getDoctorDetails(doctorModel.id),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(title: Text(doctorModel.name)),
          body: DoctorDetailsBody(),
        ),
      ),
    );
  }
}
