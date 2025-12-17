import 'package:flutter/material.dart';

class AccountDropdown extends StatefulWidget {
  final String label;
  final List<String> accounts;
  final String? selectedAccount;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const AccountDropdown({
    Key? key,
    required this.label,
    required this.accounts,
    this.selectedAccount,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<AccountDropdown> createState() => _AccountDropdownState();
}

class _AccountDropdownState extends State<AccountDropdown> {
  late String? _selectedAccount;

  @override
  void initState() {
    super.initState();
    _selectedAccount = widget.selectedAccount;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedAccount,
      decoration: InputDecoration(
        label: Text(widget.label),
      ),
      items: widget.accounts
          .map((account) => DropdownMenuItem(
                value: account,
                child: Text(account),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedAccount = value;
        });
        widget.onChanged(value);
      },
      validator: widget.validator,
    );
  }
}
