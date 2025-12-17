# Account Manager - Personal Finance App

A powerful Flutter Android app for managing multiple accounts, tracking transactions, expenses, market purchases, loans, and viewing comprehensive financial reports with full edit/delete support.

## 🎯 Features

### 1. Account Management
- Create and manage multiple accounts (Salary, Savings, Cash, Custom)
- Track current balance, total income, and total expenses per account
- Edit and delete accounts

### 2. Transactions
- **Salary Add**: Quick salary income entry
- **Receive Money**: Track incoming funds
- **Expense Tracking**: Categorized expenses with 8 categories
  - Groceries, Transportation, Utilities, Send Home, Health, Shopping, Eat Out, Others
- **Transfer Money**: Move funds between accounts
- **Withdraw**: Automatic cash account updates

### 3. Market Purchases
- Add market items with price and date/time
- Group items by purchase date and time
- Monthly expense tracking
- Full edit/delete support

### 4. Financial Reports
- Monthly market report with daily/monthly totals
- All expenses report (combined market + other expenses)
- Transaction summary by category and date
- Monthly and yearly overviews with income/expense breakdowns
- Category-wise expense analysis

### 5. Loan Management
- Personal loan directory with tracking
- Money given and money taken
- Due balance calculation
- Editable loan entries

### 6. User Interface
- Material 3 design
- Light and dark themes
- Bottom navigation for quick access
- Drawer menu for reports and settings
- Responsive layout

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/          # App-wide constants
│   ├── theme/              # Material 3 theme
│   ├── utils/              # Utilities (date, currency, validators)
│   ├── widgets/            # Reusable widgets
│   └── services/           # Hive database service
├── data/
│   ├── models/             # Data models
│   ├── datasources/        # Local data sources (Hive)
│   └── repositories/       # Data repositories
├── providers/              # Riverpod state management
├── features/               # Feature modules (UI/Pages)
│   ├── accounts/
│   ├── transactions/
│   ├── market/
│   ├── reports/
│   ├── loans/
│   └── settings/
├── navigation/             # Routing and navigation
├── extensions/             # Dart extensions
├── main.dart
└── app.dart
```

## 🛠️ Tech Stack

- **Framework**: Flutter (latest stable)
- **State Management**: Riverpod
- **Local Database**: Hive (offline-first)
- **UI**: Material 3
- **Navigation**: GoRouter
- **Charts**: FL Charts (for reports)
- **Date/Time**: intl package

## ⚙️ Setup Instructions

### Prerequisites
- Flutter SDK 3.1.0 or higher
- Dart SDK 3.1.0 or higher
- Android SDK (for Android development)

### Installation

1. **Clone the project**
   ```bash
   git clone <repository-url>
   cd Account-Manager
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Build Hive adapters** (if using Hive with type adapters)
   ```bash
   flutter pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Usage Guide

### Creating an Account
1. Open the drawer menu
2. Tap "Accounts"
3. Click the (+) button
4. Enter account name and initial balance
5. Save

### Adding a Transaction
1. Go to Transactions (home page)
2. Tap "New Transaction"
3. Choose transaction type (Salary, Expense, Transfer, Withdraw)
4. Fill in details
5. Tap Add

### Adding an Expense
1. In New Transaction, select "Expense" tab
2. Enter date, amount, account, description
3. Select category (mandatory)
4. Tap Add Expense

### Viewing Reports
- **Monthly Overview**: Drawer > Monthly Overview
- **Yearly Overview**: Drawer > Yearly Overview
- **Expense Report**: Bottom navigation
- **Transaction Summary**: Bottom navigation

## 🔐 Data Persistence

All data is stored locally using Hive for offline-first functionality:
- Accounts
- Transactions
- Expenses
- Market items
- Loans

## 🎨 Customization

### Theme Colors
Edit `lib/core/theme/color_scheme.dart` to customize colors:
- Primary: Indigo (#6366F1)
- Secondary: Emerald (#10B981)
- Tertiary: Amber (#F59E0B)

### Currency
Default currency is set to TK (Bangladeshi Taka).
Edit in `lib/core/utils/currency_formatter.dart`

## 🧪 Testing

Run tests with:
```bash
flutter test
```

Test file includes:
- Account model tests
- Expense calculations
- Transaction types
- Data serialization

## 🚀 Building for Release

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

The built files will be in:
- APK: `build/app/outputs/apk/release/`
- Bundle: `build/app/outputs/bundle/release/`

## 📊 Key Business Logic

### Account Balance Updates
- **Salary/Receive**: Adds to account balance
- **Expense**: Deducts from selected account
- **Transfer**: Deducts from source, adds to destination
- **Withdraw**: Deducts from source, adds to cash account

### Total Calculations
- **Total In**: Sum of all incoming transactions
- **Total Out**: Sum of all outgoing transactions
- **Net Balance**: Total In - Total Out

### Reports
- Grouped by date and category
- Monthly/yearly aggregations
- Category-wise breakdowns
- Daily/monthly totals

## 📝 Providers (Riverpod)

Main providers:
- `accountsProvider`: All accounts
- `transactionsProvider`: All transactions
- `expensesProvider`: All expenses
- `marketItemsProvider`: All market items
- `loansProvider`: All loans
- `themeProvider`: Light/Dark mode toggle
- `selectedMonthProvider`: Current month selection

## 🐛 Troubleshooting

### Hive Database Issues
Clear all data:
```dart
await HiveService.clearAllBoxes();
```

### Build Issues
Clean and rebuild:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build
```

## 📄 License

This project is built as a personal finance management solution.

## 🤝 Contributing

Contributions are welcome! Feel free to:
1. Report bugs
2. Suggest features
3. Submit pull requests

## 📞 Support

For issues or questions, please create an issue in the repository.

---

**Version**: 1.0.0  
**Last Updated**: December 2024  
**Made with ❤️ using Flutter**