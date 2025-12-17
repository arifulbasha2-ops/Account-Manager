# API & Functions Reference - Account Manager

## 📚 Core Functions & Classes

### Models

#### AccountModel
```dart
// Constructor
AccountModel({
  String? id,
  required String name,
  double balance = 0,
  double totalIn = 0,
  double totalOut = 0,
  DateTime? createdAt,
  DateTime? updatedAt,
})

// Methods
Map<String, dynamic> toMap()
AccountModel fromMap(Map<String, dynamic> map)
AccountModel copyWith({...})
String toString()
```

#### TransactionModel
```dart
TransactionModel({
  String? id,
  required String type,  // 'salary'|'receive'|'expense'|'transfer'|'withdraw'
  required String accountId,
  String? fromAccountId,
  String? toAccountId,
  required double amount,
  required String description,
  String? category,
  required DateTime date,
  DateTime? createdAt,
})

Map<String, dynamic> toMap()
TransactionModel fromMap(Map<String, dynamic> map)
TransactionModel copyWith({...})
```

#### ExpenseModel
```dart
ExpenseModel({
  String? id,
  required double amount,
  required String fromAccountId,
  required String description,
  required String category,
  required DateTime date,
  DateTime? createdAt,
})

Map<String, dynamic> toMap()
ExpenseModel fromMap(Map<String, dynamic> map)
ExpenseModel copyWith({...})
```

#### MarketItemModel
```dart
MarketItemModel({
  String? id,
  required String itemName,
  required double price,
  required String accountId,
  required DateTime dateTime,
  DateTime? createdAt,
})

Map<String, dynamic> toMap()
MarketItemModel fromMap(Map<String, dynamic> map)
MarketItemModel copyWith({...})
```

#### LoanModel
```dart
LoanModel({
  String? id,
  required String personName,
  required double moneyGiven,
  required double moneyTaken,
  required String fromAccount,
  required String toAccount,
  DateTime? createdAt,
})

double get dueBalance => moneyGiven - moneyTaken
Map<String, dynamic> toMap()
LoanModel fromMap(Map<String, dynamic> map)
LoanModel copyWith({...})
```

---

### Repositories

#### AccountRepository
```dart
class AccountRepository {
  // CRUD Operations
  Future<void> addAccount(AccountModel account)
  Future<List<AccountModel>> getAllAccounts()
  Future<AccountModel?> getAccountById(String id)
  Future<void> updateAccount(AccountModel account)
  Future<void> deleteAccount(String id)
  Future<void> clearAllAccounts()
}
```

#### TransactionRepository
```dart
class TransactionRepository {
  Future<void> addTransaction(TransactionModel transaction)
  Future<List<TransactionModel>> getAllTransactions()
  Future<List<TransactionModel>> getTransactionsByAccountId(String accountId)
  Future<List<TransactionModel>> getTransactionsByMonth(int year, int month)
  Future<TransactionModel?> getTransactionById(String id)
  Future<void> updateTransaction(TransactionModel transaction)
  Future<void> deleteTransaction(String id)
  Future<void> clearAllTransactions()
}
```

#### ExpenseRepository
```dart
class ExpenseRepository {
  Future<void> addExpense(ExpenseModel expense)
  Future<List<ExpenseModel>> getAllExpenses()
  Future<List<ExpenseModel>> getExpensesByMonth(int year, int month)
  Future<List<ExpenseModel>> getExpensesByCategory(String category)
  Future<List<ExpenseModel>> getExpensesByAccountId(String accountId)
  Future<ExpenseModel?> getExpenseById(String id)
  Future<void> updateExpense(ExpenseModel expense)
  Future<void> deleteExpense(String id)
  Future<void> clearAllExpenses()
}
```

#### MarketRepository
```dart
class MarketRepository {
  Future<void> addMarketItem(MarketItemModel item)
  Future<List<MarketItemModel>> getAllMarketItems()
  Future<List<MarketItemModel>> getMarketItemsByMonth(int year, int month)
  Future<List<MarketItemModel>> getMarketItemsByAccountId(String accountId)
  Future<MarketItemModel?> getMarketItemById(String id)
  Future<void> updateMarketItem(MarketItemModel item)
  Future<void> deleteMarketItem(String id)
  Future<void> clearAllMarketItems()
}
```

#### LoanRepository
```dart
class LoanRepository {
  Future<void> addLoan(LoanModel loan)
  Future<List<LoanModel>> getAllLoans()
  Future<LoanModel?> getLoanById(String id)
  Future<void> updateLoan(LoanModel loan)
  Future<void> deleteLoan(String id)
  Future<void> clearAllLoans()
}
```

---

### Utilities

#### DateUtils
```dart
String formatDate(DateTime date)                // "17 Dec 2024"
String formatDateTime(DateTime dateTime)        // "17 Dec 2024, 02:30 PM"
String formatTime(DateTime time)                // "02:30 PM"
String formatMonth(DateTime date)               // "December 2024"
String formatYear(DateTime date)                // "2024"

bool isSameDay(DateTime date1, DateTime date2)
bool isSameMonth(DateTime date1, DateTime date2)
bool isSameYear(DateTime date1, DateTime date2)

DateTime getFirstDayOfMonth(DateTime date)
DateTime getLastDayOfMonth(DateTime date)
DateTime getFirstDayOfYear(DateTime date)
DateTime getLastDayOfYear(DateTime date)

DateTime getPreviousMonth(DateTime date)
DateTime getNextMonth(DateTime date)
DateTime getPreviousYear(DateTime date)
DateTime getNextYear(DateTime date)
```

#### CurrencyFormatter
```dart
String format(double amount)                    // "TK 1,500.00"
String formatCompact(double amount)             // "TK 1.5K"
String formatWithoutCurrency(double amount)     // "1,500.00"
double parseAmount(String amount)
```

#### Validators
```dart
String? validateNotEmpty(String? value)
String? validateAmount(String? value)
String? validateAccountName(String? value)
String? validateDescription(String? value)
String? validatePersonName(String? value)
String? validateAccountSelection(String? value)
String? validateCategorySelection(String? value)
String? validateTransferAccounts(String? from, String? to)
```

---

### Services

#### HiveService
```dart
class HiveService {
  static Future<void> init()                    // Initialize Hive
  static Box<dynamic> getBox(String boxName)   // Get box reference
  static Future<void> closeAllBoxes()          // Close all boxes
  static Future<void> clearAllBoxes()          // Clear all data
}
```

---

### Riverpod Providers

#### Data Source Providers
```dart
final accountLocalDsProvider                  // AccountLocalDataSource
final transactionLocalDsProvider              // TransactionLocalDataSource
final expenseLocalDsProvider                  // ExpenseLocalDataSource
final marketLocalDsProvider                   // MarketLocalDataSource
final loanLocalDsProvider                     // LoanLocalDataSource
```

#### Repository Providers
```dart
final accountRepositoryProvider               // AccountRepository
final transactionRepositoryProvider           // TransactionRepository
final expenseRepositoryProvider               // ExpenseRepository
final marketRepositoryProvider                // MarketRepository
final loanRepositoryProvider                  // LoanRepository
```

#### Data Providers
```dart
// Accounts
final accountsProvider 
  // FutureProvider<List<AccountModel>>
final accountByIdProvider(String id)
  // FutureProvider.family<AccountModel?, String>

// Transactions
final transactionsProvider
  // FutureProvider<List<TransactionModel>>
final transactionsByMonthProvider((int, int))
  // FutureProvider.family<List<TransactionModel>, (year, month)>
final transactionsByAccountProvider(String accountId)
  // FutureProvider.family<List<TransactionModel>, String>

// Expenses
final expensesProvider
  // FutureProvider<List<ExpenseModel>>
final expensesByMonthProvider((int, int))
  // FutureProvider.family<List<ExpenseModel>, (year, month)>
final expensesByCategoryProvider(String category)
  // FutureProvider.family<List<ExpenseModel>, String>

// Market Items
final marketItemsProvider
  // FutureProvider<List<MarketItemModel>>
final marketItemsByMonthProvider((int, int))
  // FutureProvider.family<List<MarketItemModel>, (year, month)>

// Loans
final loansProvider
  // FutureProvider<List<LoanModel>>
final loanByIdProvider(String id)
  // FutureProvider.family<LoanModel?, String>
```

#### UI State Providers
```dart
final themeProvider                           // StateProvider<bool>
final selectedMonthProvider                   // StateProvider<(int, int)>
final selectedYearProvider                    // StateProvider<int>
```

---

### Constants

#### AppStrings
```dart
static const String appName = 'Account Manager'
static const String currencySymbol = 'TK'
static const String salaryAccount = 'Salary Account'
static const String savingsAccount = 'Savings Account'
static const String cashAccount = 'Cash Account'

// 50+ string constants for UI
```

#### ExpenseCategories
```dart
static const List<String> categories = [...]  // 8 categories
static const String defaultCategory = 'Groceries'
static String getCategoryEmoji(String category)
```

#### HiveBoxes
```dart
static const String accounts = 'accounts'
static const String transactions = 'transactions'
static const String expenses = 'expenses'
static const String marketItems = 'market_items'
static const String loans = 'loans'
static const String loanPersons = 'loan_persons'
static const String settings = 'settings'
```

#### RouteNames
```dart
static const String home = '/'
static const String transactions = '/transactions'
static const String market = '/market'
static const String marketReport = '/market-report'
static const String expenseReport = '/expense-report'
// ... 8 routes total
```

---

### Widgets

#### CustomButton
```dart
CustomButton({
  required String label,
  required VoidCallback onPressed,
  bool isLoading = false,
  bool isEnabled = true,
  double? width,
  double height = 48,
  Color? backgroundColor,
  Color? foregroundColor,
  IconData? icon,
})
```

#### CustomTextField
```dart
CustomTextField({
  required String label,
  String? hint,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  bool readOnly = false,
  int maxLines = 1,
  int minLines = 1,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
  IconData? prefixIcon,
  IconData? suffixIcon,
  void Function()? onSuffixIconPressed,
  TextInputAction? textInputAction,
  void Function(String)? onSubmitted,
})
```

#### DatePickerField
```dart
DatePickerField({
  required String label,
  DateTime? selectedDate,
  required ValueChanged<DateTime> onDateSelected,
  DateTime? firstDate,
  DateTime? lastDate,
})
```

#### AccountDropdown
```dart
AccountDropdown({
  required String label,
  required List<String> accounts,
  String? selectedAccount,
  required ValueChanged<String?> onChanged,
  String? Function(String?)? validator,
})
```

#### CategoryDropdown
```dart
CategoryDropdown({
  required String label,
  String? selectedCategory,
  required ValueChanged<String?> onChanged,
  String? Function(String?)? validator,
})
```

---

### Context Extensions

#### ContextExtensions
```dart
extension ContextExtensions on BuildContext {
  ThemeData get theme
  TextTheme get textTheme
  ColorScheme get colorScheme
  double get width
  double get height
  bool get isDarkMode
  EdgeInsets get padding
  EdgeInsets get viewInsets
}
```

---

### Theme

#### AppTheme
```dart
static ThemeData getLightTheme()
static ThemeData getDarkTheme()
static Color getCategoryColor(String category)
```

#### ColorScheme
```dart
// Light & Dark color definitions
static const Color primaryColor = Color(0xFF6366F1)      // Indigo
static const Color secondaryColor = Color(0xFF10B981)    // Emerald
static const Color tertiaryColor = Color(0xFFF59E0B)     // Amber
static const Color successColor = Color(0xFF10B981)
static const Color errorColor = Color(0xFFEF4444)
static const Color warningColor = Color(0xFFF59E0B)
static const Color infoColor = Color(0xFF3B82F6)
```

---

## 🔌 Integration Examples

### Using Providers in Widget
```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final accountsAsync = ref.watch(accountsProvider);
  
  return accountsAsync.when(
    data: (accounts) => ListView(...),
    loading: () => CircularProgressIndicator(),
    error: (error, stack) => Text('Error: $error'),
  );
}
```

### Adding Data
```dart
final repository = ref.watch(accountRepositoryProvider);
await repository.addAccount(AccountModel(
  name: 'My Account',
  balance: 1000,
));
ref.refresh(accountsProvider);  // Refresh UI
```

### Form Validation
```dart
Form(
  key: _formKey,
  child: Column(
    children: [
      CustomTextField(
        label: 'Amount',
        validator: Validators.validateAmount,
      ),
      CustomButton(
        label: 'Add',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Process
          }
        },
      ),
    ],
  ),
)
```

### Currency Operations
```dart
double total = accounts.fold(0, (sum, acc) => sum + acc.balance);
String formatted = CurrencyFormatter.format(total);  // TK 5,000.00
```

### Date Operations
```dart
DateTime now = DateTime.now();
String monthStr = DateUtils.formatMonth(now);        // December 2024
List<int> monthDates = [now.month, now.year];
```

---

## 📊 Database Box Structure

All boxes store data as `{String key: Map<String, dynamic> value}`

```dart
// Example: Adding to accounts box
final box = HiveService.getBox(HiveBoxes.accounts);
box.put(account.id, account.toMap());

// Example: Retrieving from accounts box
final accountData = box.get(accountId) as Map<dynamic, dynamic>;
final account = AccountModel.fromMap(Map<String, dynamic>.from(accountData));
```

---

## 🎯 Common Workflows

### Create Account
```dart
1. Create AccountModel
2. Call repo.addAccount()
3. Refresh accountsProvider
4. UI updates automatically
```

### Track Expense
```dart
1. Create ExpenseModel with category
2. Call repo.addExpense()
3. Update account balance
4. Refresh relevant providers
5. Show success message
```

### Transfer Money
```dart
1. Validate from/to accounts are different
2. Create TransactionModel with type='transfer'
3. Update both accounts
4. Call repo.addTransaction()
5. Refresh providers
```

### Generate Report
```dart
1. Get expenses by month using repo.getExpensesByMonth()
2. Group by category
3. Calculate totals
4. Format with CurrencyFormatter
5. Display in chart
```

---

## 🔍 Error Handling Pattern

```dart
try {
  final accounts = await repository.getAllAccounts();
  // Process accounts
} catch (e) {
  // Handle error
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error: $e')),
  );
}
```

---

## 📝 Testing Functions

All models, repositories, and utilities have test-friendly methods:

```dart
// Test account creation
test('Create account', () {
  final account = AccountModel(name: 'Test');
  expect(account.name, 'Test');
});

// Test serialization
test('Account serialization', () {
  final account = AccountModel(name: 'Test');
  final map = account.toMap();
  final restored = AccountModel.fromMap(map);
  expect(restored.name, account.name);
});
```

---

## 🎓 Quick Lookup Table

| Task | Function/Class |
|------|---|
| Format currency | `CurrencyFormatter.format()` |
| Format date | `DateUtils.formatDate()` |
| Validate input | `Validators.validateAmount()` |
| Get accounts | `accountRepository.getAllAccounts()` |
| Add account | `accountRepository.addAccount()` |
| Get theme | `AppTheme.getLightTheme()` |
| Get provider | `ref.watch(accountsProvider)` |
| Initialize DB | `HiveService.init()` |
| Get category emoji | `ExpenseCategories.getCategoryEmoji()` |

---

**Last Updated**: December 2024  
**Version**: 1.0.0  
**Framework**: Flutter 3.1.0+
