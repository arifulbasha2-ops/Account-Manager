class ExpenseCategories {
  static const List<String> categories = [
    'Groceries',
    'Transportation',
    'Utilities',
    'Send Home',
    'Health',
    'Shopping',
    'Eat Out',
    'Others',
  ];
  
  static const String defaultCategory = 'Groceries';
  
  static String getCategoryEmoji(String category) {
    switch (category) {
      case 'Groceries':
        return '🛒';
      case 'Transportation':
        return '🚗';
      case 'Utilities':
        return '⚡';
      case 'Send Home':
        return '🏠';
      case 'Health':
        return '🏥';
      case 'Shopping':
        return '🛍️';
      case 'Eat Out':
        return '🍽️';
      case 'Others':
        return '📦';
      default:
        return '📌';
    }
  }
}
