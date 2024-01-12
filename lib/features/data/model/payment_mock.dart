final paymentMethods = [
  PaymentMethod(name: 'Card ( visa )', imagePath: 'assets/imgs/pay/visa.png'),
  PaymentMethod(
      name: 'Google pay', imagePath: 'assets/imgs/pay/google_pay.png'),
  PaymentMethod(name: 'Apple pay', imagePath: 'assets/imgs/pay/apple_pay.png'),
];

class PaymentMethod {
  final String name;
  final String imagePath;

  const PaymentMethod({
    required this.name,
    required this.imagePath,
  });
}
