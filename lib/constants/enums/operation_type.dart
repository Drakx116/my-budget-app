enum OperationType {
  expense,
  income
}

extension GetValue on OperationType {
  String get value {
    switch (this) {
      case OperationType.expense: return 'Dépense';
      case OperationType.income: return 'Rentrée';
      default: return '';
    }
  }
}

extension From on OperationType {
  OperationType from(String value) {
    switch (value) {
      case 'Dépense': return OperationType.expense;
      case 'Rentrée': return OperationType.income;
      default: return OperationType.expense;
    }
  }
}

fromValue(String value) {
  switch (value) {
    case 'Dépense': return OperationType.expense;
    case 'Rentrée': return OperationType.income;
    default: return OperationType.expense;
  }
}