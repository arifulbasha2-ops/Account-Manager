import 'package:go_router/go_router.dart';
import '../features/transactions/transaction_home_page.dart';
import '../features/market/market_list_page.dart';
import '../features/reports/expense_report_page.dart';
import '../features/reports/transaction_summary_page.dart';
import '../features/accounts/account_list_page.dart';
import '../features/reports/monthly_overview_page.dart';
import '../features/reports/yearly_overview_page.dart';
import '../features/loans/loan_directory_page.dart';
import '../core/constants/route_names.dart';

class AppRouter {
  GoRouter config() {
    return GoRouter(
      initialLocation: RouteNames.home,
      routes: [
        GoRoute(
          path: RouteNames.home,
          builder: (context, state) => const TransactionHomePage(),
        ),
        GoRoute(
          path: RouteNames.market,
          builder: (context, state) => const MarketListPage(),
        ),
        GoRoute(
          path: RouteNames.expenseReport,
          builder: (context, state) => const ExpenseReportPage(),
        ),
        GoRoute(
          path: RouteNames.transactionSummary,
          builder: (context, state) => const TransactionSummaryPage(),
        ),
        GoRoute(
          path: RouteNames.accountsList,
          builder: (context, state) => const AccountListPage(),
        ),
        GoRoute(
          path: RouteNames.monthlyOverview,
          builder: (context, state) => const MonthlyOverviewPage(),
        ),
        GoRoute(
          path: RouteNames.yearlyOverview,
          builder: (context, state) => const YearlyOverviewPage(),
        ),
        GoRoute(
          path: RouteNames.loanManagement,
          builder: (context, state) => const LoanDirectoryPage(),
        ),
      ],
    );
  }
}
