import 'package:dio/dio.dart';
import 'package:docdoc/core/local_storage/LocalStorage.dart';
import 'package:docdoc/core/networking/apiconstant.dart';
import 'package:docdoc/core/networking/diofactor.dart';
import 'package:docdoc/pages/doctors_detail/model/doctor_model.dart';
import 'package:docdoc/pages/doctors_detail/ui/doctor_about.dart';
import 'package:docdoc/pages/doctors_detail/ui/doctor_location.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoctorDetailsProvider extends ChangeNotifier {
  DoctorDetailModel? doctor;

  void getDoctorDetails(int id) async {
    final dio = Dio();
    doctor = null;
    notifyListeners();
    final token = LocalStorage.getString('token');
    final response = await dio.get(
      '${ApiConstants.doctorDetails}/$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final data = DoctorDetailsResponseModel.fromJson(response.data);
    doctor = data.doctor;
    notifyListeners();
  }

  final startTimeController = TextEditingController();
  final notesController = TextEditingController();

  void storeAppointment(BuildContext context) async {
    if (startTimeController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter a start time');
      return;
    }
    await DioFactory.postData(
      ApiConstants.storeAppointment,
      data: {
        'doctor_id': doctor?.id,
        'start_time': startTimeController.text,
        'notes': notesController.text,
      },
      token: LocalStorage.getString('token'),
    );
    Fluttertoast.showToast(msg: 'Appointment stored successfully');
    Navigator.pop(context);
  }

  int currentIndex = 0;
  final List<Widget> doctorDetailsScreens = [
    DoctorDetailsAbout(),
    DoctorDetailsLocation(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
