import 'package:docdoc/pages/Home/models/specialization_model.dart';

class DoctorDetailsResponseModel {
  final bool status;
  final String message;
  final DoctorDetailModel doctor;

  DoctorDetailsResponseModel({
    required this.status,
    required this.message,
    required this.doctor,
  });

  factory DoctorDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsResponseModel(
      status: json['status'],
      message: json['message'],
      doctor: DoctorDetailModel.fromJson(json['data']),
    );
  }
}

class DoctorDetailModel {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final Specialization specialization;
  final CityModel city;
  final num appointPrice;
  final String startTime;
  final String endTime;

  DoctorDetailModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });
  factory DoctorDetailModel.fromJson(Map<String, dynamic> json) {
    return DoctorDetailModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      photo: json['photo'],
      gender: json['gender'],
      address: json['address'],
      description: json['description'],
      degree: json['degree'],
      specialization: Specialization.fromJson(json['specialization']),
      city: CityModel.fromJson(json['city']),
      appointPrice: json['appoint_price'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}

class CityModel {
  final int id;
  final String name;
  final GovernrateModel governrate;

  CityModel({required this.id, required this.name, required this.governrate});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      governrate: GovernrateModel.fromJson(json['governrate']),
    );
  }
}

class GovernrateModel {
  final int id;
  final String name;

  GovernrateModel({required this.id, required this.name});
  factory GovernrateModel.fromJson(Map<String, dynamic> json) {
    return GovernrateModel(id: json['id'], name: json['name']);
  }
}
