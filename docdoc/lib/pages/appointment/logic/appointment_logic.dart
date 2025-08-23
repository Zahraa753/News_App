import 'package:docdoc/core/local_storage/LocalStorage.dart';
import 'package:docdoc/core/networking/apiconstant.dart';
import 'package:docdoc/core/networking/diofactor.dart';
import 'package:docdoc/pages/appointment/model/appointment_model.dart';
import 'package:flutter/material.dart';

class AppointmentsProvider extends ChangeNotifier {
  List<AppointmentModel> appointments = [];

  void getAllAppointments() async {
    final response = await DioFactory.getData(
      ApiConstants.getAllAppointments,
      token: LocalStorage.getString('token'),
    );
    final data = AppointmentsResponseModel.fromJson(response.data);
    appointments = data.appointments;
    notifyListeners();
  }
}
