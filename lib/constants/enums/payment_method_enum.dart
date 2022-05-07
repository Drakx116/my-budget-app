enum PaymentMethodType {
  cash,
  check,
  creditCard,
  mealVoucher
}

extension GetValue on PaymentMethodType {
  String get value {
    switch (this) {
      case PaymentMethodType.cash: return 'Espèces';
      case PaymentMethodType.check: return 'Chèque';
      case PaymentMethodType.creditCard: return 'Carte de Crédit';
      case PaymentMethodType.mealVoucher: return 'Ticket Restaurant';
      default: return '';
    }
  }
}

extension From on PaymentMethodType {
  PaymentMethodType from(String value) {
    switch (value) {
      case 'Espèces': return PaymentMethodType.cash;
      case 'Chèque': return PaymentMethodType.check;
      case 'Carte de Crédit': return PaymentMethodType.creditCard;
      case 'Ticket Restaurant': return PaymentMethodType.mealVoucher;
      default: return PaymentMethodType.creditCard;
    }
  }
}