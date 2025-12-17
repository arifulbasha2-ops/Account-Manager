import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/currency_formatter.dart';
import '../../data/models/account_model.dart';
import '../../providers/providers.dart';
import '../../navigation/drawer_menu.dart';
import 'widgets/expense_form.dart';
import 'widgets/transfer_form.dart';
import 'widgets/withdraw_form.dart';

class TransactionHomePage extends ConsumerWidget {
  const TransactionHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.transactions),
        elevation: 0,
      ),
      drawer: const DrawerMenu(),
      body: accountsAsync.when(
        data: (accounts) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Account Summary Card
                if (accounts.isNotEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Balance',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            CurrencyFormatter.format(
                              accounts.fold<double>(
                                0,
                                (sum, account) => sum + account.balance,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                
                // Accounts List
                const Text(
                  'Your Accounts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    final account = accounts[index];
                    return AccountTile(account: account);
                  },
                ),
                const SizedBox(height: 24),
                
                // Add New Transaction Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Show modal bottom sheet for new transaction
                      _showNewTransactionModal(context, ref, accounts);
                    },
                    child: const Text('+ New Transaction'),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  void _showNewTransactionModal(
    BuildContext context,
    WidgetRef ref,
    List<AccountModel> accounts,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New Transaction',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 520,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: 'Expense'),
                            Tab(text: 'Transfer'),
                            Tab(text: 'Withdraw'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ExpenseForm(accounts: accounts),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TransferForm(accounts: accounts),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: WithdrawForm(accounts: accounts),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final AccountModel account;

  const AccountTile({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(account.name),
        subtitle: Text(
          'Balance: ${CurrencyFormatter.format(account.balance)}',
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'In: ${CurrencyFormatter.formatCompact(account.totalIn)}',
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              'Out: ${CurrencyFormatter.formatCompact(account.totalOut)}',
              style: const TextStyle(fontSize: 12, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
