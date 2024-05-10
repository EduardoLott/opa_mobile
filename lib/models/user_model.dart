class UserModel {
  String username;
  String password;
  String email;
  String name;
  String gender;
  String cpf;
  String phoneNumber;
  String street;
  String neighborhood;
  String streetNumber;
  String complement;
  String city;
  String state;
  String cep;
  String birthDate;

  UserModel({
    required this.username,
    required this.password,
    required this.email,
    required this.name,
    required this.gender,
    required this.cpf,
    required this.phoneNumber,
    required this.street,
    required this.neighborhood,
    required this.streetNumber,
    required this.complement,
    required this.city,
    required this.state,
    required this.cep,
    required this.birthDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'name': name,
      'gender': gender,
      'cpf': cpf,
      'phoneNumber': phoneNumber,
      'street': street,
      'neighborhood': neighborhood,
      'streetNumber': streetNumber,
      'complement': complement,
      'city': city,
      'state': state,
      'cep': cep,
      'birthDate': birthDate,
    };
  }
}
