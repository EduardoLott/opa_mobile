import 'package:intl/intl.dart'; // Importe o pacote intl

class PaymentOrderDTO {
  String name;
  num qt;
  num totalPrice;
  num dividedPrice;

  factory PaymentOrderDTO.fromJson(Map<String, dynamic> json) {
    var order = PaymentOrderDTO(
      qt: json['qt'],
      name: json['name'],
      dividedPrice: json['dividedPrice'],
      totalPrice: json['totalPrice'],
    );
    return order;
  }

  PaymentOrderDTO({
    required this.name,
    required this.qt,
    required this.totalPrice,
    required this.dividedPrice,
  });

  String formattedTotalPrice() {
    var formatter = NumberFormat('#,##0.00', 'pt_BR');
    return formatter.format(totalPrice);
  }

  String formattedDividedPrice() {
    var formatter = NumberFormat('#,##0.00', 'pt_BR');
    return formatter.format(dividedPrice);
  }
}
