enum BoxType {
  expense('expense'),
  accounts('accounts'),
  category('category'),
  categoryTag('categoryTag'),
  settings('settings'),
  debts('debts'),
  transactions('transactions');

  final String name;

  const BoxType(this.name);
}
