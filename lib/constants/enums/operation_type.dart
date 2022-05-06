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