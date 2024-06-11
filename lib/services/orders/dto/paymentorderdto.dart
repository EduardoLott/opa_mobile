class PaymentOrderDTO{
  final String name;
  final int qt;
  final double totalPrice;
  final double dividedPrice;

  factory PaymentOrderDTO.fromJson(Map<String, dynamic> json) {
  return PaymentOrderDTO(
    qt: json['qt'],
    name: json['name'],
    dividedPrice: json['dividedPrice'],
    totalPrice: json['totalPrice']
  );
}

  PaymentOrderDTO({
    required this.name,
    required this.qt,
    required this.totalPrice,
    required this.dividedPrice,
  });
}
