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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthDate': birthDate,
      'cep': cep,
      'city': city,
      'complement': complement,
      'cpf': cpf,
      'email': email,
      'gender': _genderToEnum(gender),
      'neighborhood': neighborhood,
      'password': password,
      'phoneNumber': phoneNumber,
      'state': state,
      'street': street,
      'streetNumber': streetNumber,
      'username': username,
    };
  }

  _genderToEnum(String gender) {
    switch (gender) {
      case "Masculino":
        return "0";
      case "Feminino":
        return "1";
      default:
        return "2";
    }
  }

  @override
  String toString() {
    return 'User{username: $username, password: $password, email: $email, name: $name, gender: $gender, cpf: $cpf, phoneNumber: $phoneNumber, street: $street, neighborhood: $neighborhood,streetNumber: $streetNumber, complement: $complement, city: $city, state: $state, cep: $cep, birthDate: $birthDate';
  }
}
