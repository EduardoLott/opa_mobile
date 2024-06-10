class PaymentOrderDTO{
  final String name;
  final int qt;
  final double totalPrice;
  final double dividedPrice;

  PaymentOrderDTO({
    required this.name,
    required this.qt,
    required this.totalPrice,
    required this.dividedPrice,
  });
}
