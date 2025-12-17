import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/transaction_service.dart';
import '../../../data/models/account_model.dart';

class TransferForm extends ConsumerStatefulWidget {
  final List<AccountModel> accounts;

  const TransferForm({Key? key, required this.accounts}) : super(key: key);

  @override
  ConsumerState<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends ConsumerState<TransferForm> {
  final _formKey = GlobalKey<FormState>();
  AccountModel? _fromAccount;
  AccountModel? _toAccount;
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
          DropdownButtonFormField<AccountModel>(
            decoration: const InputDecoration(labelText: 'To Account'),
            items: widget.accounts
                .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
                .toList(),
            onChanged: (v) => setState(() => _toAccount = v),
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
          Row(
            children: [
              ElevatedButton(onPressed: _submit, child: const Text('Transfer')),
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
    if (_fromAccount!.id == _toAccount!.id) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('From and To cannot be same')));
      return;
    }
    try {
      await TransactionService.transfer(
        fromAccount: _fromAccount!,
        toAccount: _toAccount!,
        amount: _amount!,
        date: _date,
        description: _descCtl.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Transfer saved')));
        Navigator.of(context).pop();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}
