class ApiConstants {
  ApiConstants._();
  static String baseUrl = "https://vcare.integration25.com/api/";
  static String register = 'auth/register';
  static String login = 'auth/login';
  static String getAllSpecializations = 'specialization/index';
  static String getAllDoctors = 'doctor/index';
  static String getProfile = 'user/profile';
  static String doctorDetails = 'doctor/show';
  static String storeAppointment = 'appointment/store';
  static String getAllAppointments = 'appointment/index';
}
