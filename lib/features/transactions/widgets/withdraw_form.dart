import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/transaction_service.dart';
import '../../../data/models/account_model.dart';
import '../../../providers/providers.dart';

class WithdrawForm extends ConsumerStatefulWidget {
  final List<AccountModel> accounts;

  const WithdrawForm({Key? key, required this.accounts}) : super(key: key);

  @override
  ConsumerState<WithdrawForm> createState() => _WithdrawFormState();
}

class _WithdrawFormState extends ConsumerState<WithdrawForm> {
  final _formKey = GlobalKey<FormState>();
  AccountModel? _fromAccount;
  double? _amount;
  DateTime _date = DateTime.now();
  final _descCtl = TextEditingController();

  @override
  void dispose() {
    _descCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cashAccount = ref.watch(cashAccountProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<AccountModel>(
            decoration: const InputDecoration(labelText: 'From Account'),
            items: widget.accounts
                .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
                .toList(),
            onChanged: (v) => setState(() => _fromAccount = v),
            validator: (v) => v == null ? 'Select account' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSaved: (s) => _amount = double.tryParse(s ?? ''),
            validator: (s) {
              final v = double.tryParse(s ?? '');
              if (v == null || v <= 0) return 'Enter valid amount';
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _descCtl,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: 12),
          if (cashAccount == null)
            const Text('No Cash account found. Create an account named "Cash" to use Withdraw.'),
          Row(
            children: [
              ElevatedButton(
                onPressed: cashAccount == null ? null : _submit,
                child: const Text('Withdraw to Cash'),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => _date = picked);
                },
                child: Text('Date: ${_date.toLocal().toIso8601String().split('T').first}'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final cashAccount = ref.read(cashAccountProvider);
    if (cashAccount == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cash account not found')));
      return;
    }
    try {
      await TransactionService.withdraw(
        fromAccount: _fromAccount!,
        cashAccount: cashAccount,
        amount: _amount!,
        date: _date,
        description: _descCtl.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Withdraw saved')));
        Navigator.of(context).pop();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}
