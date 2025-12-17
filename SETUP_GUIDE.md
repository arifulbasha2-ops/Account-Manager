# Setup Guide for Account Manager

## 🔧 Development Environment Setup

### 1. Prerequisites
- **Flutter SDK**: 3.1.0 or higher
  ```bash
  flutter --version
  ```
- **Dart SDK**: 3.1.0 or higher (comes with Flutter)
- **Android SDK**: API 21 (Android 5.0) or higher
- **Java Development Kit (JDK)**: 11 or higher

### 2. Initial Setup

#### Step 1: Get Dependencies
```bash
cd Account-Manager
flutter clean
flutter pub get
```

#### Step 2: Build Code Generators
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

#### Step 3: Verify Setup
```bash
flutter doctor
```
All items should show green checkmarks.

## 📱 Running the App

### On Android Emulator
```bash
flutter emulators --launch Pixel_4_API_30  # Or your emulator name
flutter run
```

### On Physical Android Device
1. Enable USB Debugging on your device
2. Connect device via USB
3. Run:
   ```bash
   flutter run
   ```

### In Release Mode
```bash
flutter run --release
```

## 🏗️ Building for Production

### Build APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/apk/release/app-release.apk`

### Build App Bundle (for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

## 📦 Project Structure Explanation

### Core Layer (`lib/core/`)
- **constants/**: App-wide constants and strings
- **theme/**: Material 3 theme definitions
- **utils/**: Helper functions (date, currency, validators)
- **widgets/**: Reusable UI components
- **services/**: Hive database service

### Data Layer (`lib/data/`)
- **models/**: Data classes (Account, Transaction, Expense, etc.)
- **datasources/**: Local database operations (Hive)
- **repositories/**: Data access abstraction layer

### Business Logic (`lib/providers/`)
- Riverpod providers for state management
- Provider families for parameterized queries
- Theme and UI state management

### Feature Layer (`lib/features/`)
- **accounts/**: Account management UI
- **transactions/**: Transaction operations
- **market/**: Market purchases tracking
- **reports/**: Financial reports and analytics
- **loans/**: Loan tracking
- **settings/**: App settings

### Navigation (`lib/navigation/`)
- GoRouter configuration
- Bottom navigation bar
- Drawer menu

## 🗄️ Database (Hive)

### Hive Boxes
- `accounts`: Account data
- `transactions`: All transactions
- `expenses`: Expense records
- `market_items`: Market purchases
- `loans`: Loan records
- `settings`: App settings

### Initialize Hive
```dart
await HiveService.init();  // Called in main.dart
```

### Accessing Data
```dart
final box = HiveService.getBox(HiveBoxes.accounts);
final account = box.get(accountId);
```

## 🎨 Customization Guide

### Change Currency
Edit `lib/core/utils/currency_formatter.dart`:
```dart
static const String currency = 'USD'; // Change from 'TK'
```

### Change Primary Color
Edit `lib/core/theme/color_scheme.dart`:
```dart
static const Color primaryColor = Color(0xFF2196F3); // Change from Indigo
```

### Add New Expense Category
Edit `lib/core/constants/expense_categories.dart`:
```dart
static const List<String> categories = [
  'Groceries',
  'Transportation',
  // ... add your category
  'Your Category',
];
```

## 🔍 Debugging Tips

### Enable Debug Logging
```dart
debugPrint('Your message');  // Use instead of print()
```

### Access Riverpod DevTools
Add to `pubspec.yaml`:
```yaml
dev_dependencies:
  riverpod_generator: ^2.3.0
  riverpod_testing: ^2.0.0
```

### Clear App Data (Development)
```dart
// In your app temporarily
await HiveService.clearAllBoxes();
await HiveService.closeAllBoxes();
```

### Hot Reload vs Hot Restart
- **Hot Reload**: `r` - Fast rebuild, preserves state
- **Hot Restart**: `R` - Full restart, clears state
- **Quit**: `q` - Exit the app

## 🧪 Testing

### Run All Tests
```bash
flutter test
```

### Run Specific Test
```bash
flutter test test/account_test.dart
```

### Run with Coverage
```bash
flutter test --coverage
```

## 📊 Performance Tips

1. **Use const constructors** where possible
2. **Lazy load** data using FutureProvider
3. **Cache** frequently accessed data
4. **Use ListView.builder** for long lists
5. **Profile** with DevTools for bottlenecks

## 🚨 Common Issues & Solutions

### Issue: "Hive box not found"
**Solution**: Ensure `HiveService.init()` is called before accessing boxes
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();  // Must be before runApp
  runApp(const MyApp());
}
```

### Issue: "Build runner conflicts"
**Solution**: Delete and rebuild
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: "App crashes on startup"
**Solution**: Check Hive box initialization and Riverpod provider definitions

### Issue: "Gradle build fails"
**Solution**: Update gradle wrapper
```bash
cd android
./gradlew wrapper --gradle-version 8.0
cd ..
```

## 📋 Checklist for First Run

- [ ] Flutter SDK installed (3.1.0+)
- [ ] Android SDK configured
- [ ] Device/Emulator connected
- [ ] Dependencies installed (`flutter pub get`)
- [ ] Build runner executed
- [ ] No errors in `flutter doctor`
- [ ] App launches without errors
- [ ] Can navigate between screens
- [ ] Can add account and see it in list

## 🚀 Next Steps

1. **Implement Features**:
   - Complete transaction forms
   - Add category filtering
   - Implement report charts
   - Add loan tracking UI

2. **Enhance UI**:
   - Add splash screen
   - Implement animations
   - Add loading indicators
   - Create custom app icons

3. **Add Features**:
   - Data export (CSV/PDF)
   - Cloud sync
   - Notifications
   - Biometric security

4. **Optimize**:
   - Add image caching
   - Implement database migrations
   - Add error tracking
   - Optimize build size

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev)
- [Hive Documentation](https://docs.hivedb.dev)
- [GoRouter Documentation](https://pub.dev/packages/go_router)

## 📞 Support

For issues or questions:
1. Check [Flutter Troubleshooting](https://flutter.dev/docs/testing/troubleshooting)
2. Search GitHub issues
3. Ask on Flutter community channels

---

**Last Updated**: December 2024  
**Maintained by**: Development Team
