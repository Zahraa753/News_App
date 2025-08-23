import 'package:docdoc/pages/doctors_detail/model/doctor_model.dart';

class AppointmentsResponseModel {
  final String message;
  final bool status;
  final List<AppointmentModel> appointments;

  AppointmentsResponseModel({
    required this.message,
    required this.status,
    required this.appointments,
  });

  factory AppointmentsResponseModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsResponseModel(
      message: json['message'],
      status: json['status'],
      appointments: (json['data'] as List)
          .map((e) => AppointmentModel.fromJson(e))
          .toList(),
    );
  }
}

class AppointmentModel {
  final int id;
  final DoctorDetailModel doctor;
  final String appointmentTime;
  final String appointmentEndTime;
  final num appointmentPrice;
  final String status;
  final String notes;

  AppointmentModel({
    required this.id,
    required this.doctor,
    required this.appointmentTime,
    required this.appointmentEndTime,
    required this.appointmentPrice,
    required this.status,
    required this.notes,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      doctor: DoctorDetailModel.fromJson(json['doctor']),
      appointmentTime: json['appointment_time'],
      appointmentEndTime: json['appointment_end_time'],
      appointmentPrice: json['appointment_price'],
      status: json['status'],
      notes: json['notes'],
    );
  }
}
