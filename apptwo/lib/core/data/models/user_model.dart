class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String age;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    uid: map['uid'],
    name: map["name"],
    email: map['emailAddress'],
    phone: map['phone'],
    age: map['age'],
  );

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'emailAddress': email,
    'name': name,
    'phone': phone,
    'age': age,
  };
}
