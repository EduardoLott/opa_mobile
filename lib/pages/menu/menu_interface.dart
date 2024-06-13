class Menu {
  int id;
  String name;
  String price;
  String description;

  Menu(
      {required this.id,
      required this.name,
      required this.price,
      required this.description});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
        id: json['id'],
        description: json['description'],
        name: json['name'],
        price: json['price']);
  }
}
