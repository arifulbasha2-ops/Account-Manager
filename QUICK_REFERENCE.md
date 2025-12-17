# Quick Reference Guide - Account Manager

## 🚀 Quick Start

```bash
# 1. Get dependencies
flutter pub get

# 2. Build code generators
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Run the app
flutter run
```

## 📚 File Location Quick Reference

| Feature | Location |
|---------|----------|
| App Strings | `lib/core/constants/app_strings.dart` |
| Colors & Theme | `lib/core/theme/color_scheme.dart` |
| Account Model | `lib/data/models/account_model.dart` |
| Transaction Model | `lib/data/models/transaction_model.dart` |
| Account Repository | `lib/data/repositories/account_repository.dart` |
| All Providers | `lib/providers/providers.dart` |
| Transactions Page | `lib/features/transactions/transaction_home_page.dart` |
| Market Page | `lib/features/market/market_list_page.dart` |
| Reports Pages | `lib/features/reports/` |
| Navigation Setup | `lib/navigation/app_router.dart` |

## 🎯 Common Tasks

### Add a New Page
```dart
// 1. Create file in lib/features/[feature]/
// 2. Add route in lib/navigation/app_router.dart
GoRoute(
  path: '/route-name',
  builder: (context, state) => const MyPage(),
),
// 3. Link from navigation
```

### Add a New Model
```dart
// 1. Create in lib/data/models/
// 2. Add datasource in lib/data/datasources/local/
// 3. Add repository in lib/data/repositories/
// 4. Add providers in lib/providers/providers.dart
```

### Use Riverpod to Get Data
```dart
// In widget
final dataAsync = ref.watch(providersProvider);

// In ConsumerWidget
@override
Widget build(BuildContext context, WidgetRef ref) {
  final data = ref.watch(providersProvider);
  // ...
}
```

### Format Currency
```dart
import 'package:account_manager/core/utils/currency_formatter.dart';

CurrencyFormatter.format(1500);     // TK 1,500.00
CurrencyFormatter.formatCompact(2000000);  // TK 2.0M
```

### Format Date
```dart
import 'package:account_manager/core/utils/date_utils.dart';

DateUtils.formatDate(DateTime.now());       // 17 Dec 2024
DateUtils.formatDateTime(DateTime.now());   // 17 Dec 2024, 02:30 PM
DateUtils.formatMonth(DateTime.now());      // December 2024
```

### Validate Forms
```dart
import 'package:account_manager/core/utils/validators.dart';

validator: Validators.validateAmount,
validator: Validators.validateAccountSelection,
validator: Validators.validateCategorySelection,
```

## 🗄️ Database Operations

### Add Data
```dart
final repository = ref.watch(accountRepositoryProvider);
await repository.addAccount(AccountModel(...));
```

### Get All Data
```dart
final accounts = ref.watch(accountsProvider);
accounts.when(
  data: (accounts) { /* use accounts */ },
  loading: () { /* show loader */ },
  error: (error, stack) { /* show error */ },
);
```

### Update Data
```dart
final updatedAccount = account.copyWith(name: 'New Name');
await repository.updateAccount(updatedAccount);
ref.refresh(accountsProvider);  // Refresh UI
```

### Delete Data
```dart
await repository.deleteAccount(accountId);
ref.refresh(accountsProvider);  // Refresh UI
```

## 🎨 Theme & Styling

### Access Colors
```dart
final theme = Theme.of(context);
theme.primaryColor
theme.colorScheme.secondary
Colors.green
```

### Light/Dark Mode Toggle
```dart
final isDark = ref.watch(themeProvider);
ref.read(themeProvider.notifier).state = !isDark;
```

### Custom AppBar
```dart
AppBar(
  title: const Text(AppStrings.transactions),
  elevation: 0,
)
```

### Custom Button
```dart
CustomButton(
  label: 'Add Account',
  onPressed: () { /* action */ },
)
```

### Custom TextField
```dart
CustomTextField(
  label: 'Account Name',
  controller: controller,
  validator: Validators.validateAccountName,
  onChanged: (value) { /* action */ },
)
```

## 📊 Navigation Examples

### Navigate to Page
```dart
GoRouter.of(context).go('/route-name');
// or
context.go('/route-name');
```

### Navigate with Parameters
```dart
GoRouter.of(context).go('/accounts/$accountId');
```

### Pop Back
```dart
Navigator.of(context).pop();
// or
context.pop();
```

## 🧪 Testing

### Run Tests
```bash
flutter test                    # All tests
flutter test test/account_test.dart  # Specific test
```

### Write Test
```dart
test('description', () {
  final account = AccountModel(name: 'Test');
  expect(account.name, 'Test');
});
```

## 🔍 Debugging Tips

### Print Debug Info
```dart
debugPrint('Your message');
```

### Check Provider State
```dart
// Add Riverpod DevTools in pubspec.yaml
// Then use Flutter DevTools to inspect provider state
```

### Hot Reload
```
Press 'r' during flutter run
```

### Hot Restart
```
Press 'R' during flutter run
```

## 📦 Important Constants

### Expense Categories
```dart
ExpenseCategories.categories
// ['Groceries', 'Transportation', 'Utilities', 'Send Home', 'Health', 'Shopping', 'Eat Out', 'Others']

ExpenseCategories.getCategoryEmoji('Groceries')  // 🛒
```

### Transaction Types
```dart
'salary'    // Income
'receive'   // Money received
'expense'   // Expense
'transfer'  // Transfer between accounts
'withdraw'  // Withdraw to cash
```

### Hive Boxes
```dart
HiveBoxes.accounts
HiveBoxes.transactions
HiveBoxes.expenses
HiveBoxes.marketItems
HiveBoxes.loans
```

## ⚡ Performance Tips

1. Use `ListView.builder` for long lists
2. Use `const` constructors where possible
3. Use `FutureProvider.family` for parameterized queries
4. Cache frequently accessed data
5. Use `ref.refresh()` instead of rebuilding entire widget

## 🚨 Common Errors & Solutions

| Error | Solution |
|-------|----------|
| "Hive box not found" | Ensure `HiveService.init()` called in main.dart |
| "Provider not found" | Check provider is in `lib/providers/providers.dart` |
| "Build failed" | Run `flutter clean && flutter pub get` |
| "Type mismatch" | Check model serialization (toMap/fromMap) |
| "Navigator error" | Use `context.go()` or `GoRouter.of()` |

## 📱 Screen Navigation Map

```
Home (TransactionHomePage)
├── Transactions Tab
├── Market Tab
├── Reports Tab
├── Summary Tab
└── More Tab

Drawer Menu
├── Monthly Overview
├── Yearly Overview
├── Loan Management
├── Accounts
├── Theme Toggle
└── About
```

## 💾 Data Flow

```
UI (Features)
   ↓
Providers (Riverpod)
   ↓
Repositories
   ↓
Datasources (Hive)
   ↓
Local Database
```

## 📋 Checklist for New Features

- [ ] Create model in `lib/data/models/`
- [ ] Create datasource in `lib/data/datasources/local/`
- [ ] Create repository in `lib/data/repositories/`
- [ ] Add providers in `lib/providers/providers.dart`
- [ ] Create UI in `lib/features/`
- [ ] Add route in `lib/navigation/app_router.dart`
- [ ] Add tests in `test/`
- [ ] Update documentation
- [ ] Test thoroughly

## 🎓 Code Examples

### Complete Feature Implementation
See `lib/features/transactions/transaction_home_page.dart` for a full example.

### Complete Model Implementation
See `lib/data/models/account_model.dart` for a complete model with:
- Serialization
- Copy-with
- toString override
- Type safety

### Form Validation
Check `lib/core/utils/validators.dart` for all validators.

### Currency & Date Formatting
See `lib/core/utils/` for all formatting utilities.

---

**Need More Help?**
- See `SETUP_GUIDE.md` for detailed setup instructions
- See `PROJECT_IMPLEMENTATION_SUMMARY.md` for complete overview
- Check `README.md` for features and usage guide

**Last Updated**: December 2024
