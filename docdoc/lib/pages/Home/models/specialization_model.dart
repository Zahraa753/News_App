class SpecializationsResponseModel {
  final String message;
  final bool status;
  final List<Specialization> specializations;

  SpecializationsResponseModel({
    required this.message,
    required this.status,
    required this.specializations,
  });

  factory SpecializationsResponseModel.fromJson(Map<String, dynamic> json) {
    return SpecializationsResponseModel(
      message: json['message'],
      status: json['status'],
      specializations: (json['data'] as List<dynamic>)
          .map((e) => Specialization.fromJson(e))
          .toList(),
    );
  }
}

class Specialization {
  final int id;
  final String name;

  Specialization({required this.id, required this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(id: json['id'], name: json['name']);
  }
}
