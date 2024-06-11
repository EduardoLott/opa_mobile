class PaymentOrderDTO {
  final String name;
  final int qt;
  final int totalPrice;
  final int dividedPrice;

  factory PaymentOrderDTO.fromJson(Map<String, dynamic> json) {
    var sexo12 = PaymentOrderDTO(
        qt: json['qt'],
        name: json['name'],
        dividedPrice: json['dividedPrice'],
        totalPrice: json['totalPrice']);
    print("REI do $sexo12");
    return sexo12;
  }

  PaymentOrderDTO({
    required this.name,
    required this.qt,
    required this.totalPrice,
    required this.dividedPrice,
  });
}
