import 'package:intl/intl.dart';

class CurrencyFormatter {
  static const String currency = 'TK';
  
  static String format(double amount) {
    final formatter = NumberFormat('#,##0.00', 'en_US');
    return '$currency ${formatter.format(amount)}';
  }
  
  static String formatCompact(double amount) {
    if (amount >= 1000000) {
      return '$currency ${(amount / 1000000).toStringAsFixed(2)}M';
    } else if (amount >= 1000) {
      return '$currency ${(amount / 1000).toStringAsFixed(2)}K';
    }
    return '$currency ${amount.toStringAsFixed(0)}';
  }
  
  static String formatWithoutCurrency(double amount) {
    final formatter = NumberFormat('#,##0.00', 'en_US');
    return formatter.format(amount);
  }
  
  static double parseAmount(String amount) {
    return double.tryParse(amount.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
  }
}
