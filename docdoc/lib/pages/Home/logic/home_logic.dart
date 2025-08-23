import 'package:docdoc/core/local_storage/LocalStorage.dart';
import 'package:docdoc/core/networking/apiconstant.dart';
import 'package:docdoc/core/networking/diofactor.dart';
import 'package:docdoc/pages/Home/U_I/home_screen.dart';
import 'package:docdoc/pages/Home/models/doctors_modle';
import 'package:docdoc/pages/Home/models/specialization_model.dart';
import 'package:docdoc/pages/Home/models/user_model.dart';
import 'package:docdoc/pages/appointment/ui/appiontmet_screen.dart';
import 'package:docdoc/pages/profile/profile.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<Specialization> specializations = [];
  void getAllSpecializations() async {
    final token = LocalStorage.getString('token');
    final response = await DioFactory.getData(
      ApiConstants.getAllSpecializations,
      token: token,
    );
    final data = SpecializationsResponseModel.fromJson(response.data);
    specializations = data.specializations;
    notifyListeners();
  }

  List<DoctorModel> doctors = [];
  void getAllDoctors() async {
    final token = LocalStorage.getString('token');
    final response = await DioFactory.getData(
      ApiConstants.getAllDoctors,
      token: token,
    );
    final data = DoctorsResponseModel.fromJson(response.data);
    doctors = data.doctors;
    notifyListeners();
  }

  UserModel? user;
  void getProfile() async {
    final token = LocalStorage.getString('token');
    final response = await DioFactory.getData(
      ApiConstants.getProfile,
      token: token,
    );
    final data = UserResponseModel.fromJson(response.data);
    user = data.user;
    notifyListeners();
  }

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> homeScreens = [
    HomeScreen(),
    Container(),
    AppointmentsScreen(),
    Profile(),
  ];
}
