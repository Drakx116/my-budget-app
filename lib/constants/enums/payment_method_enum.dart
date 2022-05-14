enum PaymentMethodType {
  cash,
  check,
  credit_card,
  meal_voucher
}

extension GetValue on PaymentMethodType {
  String get value {
    switch (this) {
      case PaymentMethodType.cash: return 'Espèces';
      case PaymentMethodType.check: return 'Chèque';
      case PaymentMethodType.credit_card: return 'Carte de Crédit';
      case PaymentMethodType.meal_voucher: return 'Ticket Restaurant';
      default: return '';
    }
  }
}

extension From on PaymentMethodType {
  PaymentMethodType from(String value) {
    switch (value) {
      case 'Espèces': return PaymentMethodType.cash;
      case 'Chèque': return PaymentMethodType.check;
      case 'Carte de Crédit': return PaymentMethodType.credit_card;
      case 'Ticket Restaurant': return PaymentMethodType.meal_voucher;
      default: return PaymentMethodType.credit_card;
    }
  }
}