import 'package:flutter/material.dart';
import '../constants/expense_categories.dart';

class CategoryDropdown extends StatefulWidget {
  final String label;
  final String? selectedCategory;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CategoryDropdown({
    Key? key,
    required this.label,
    this.selectedCategory,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  late String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory ?? ExpenseCategories.defaultCategory;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedCategory,
      decoration: InputDecoration(
        label: Text(widget.label),
      ),
      items: ExpenseCategories.categories
          .map((category) => DropdownMenuItem(
                value: category,
                child: Row(
                  children: [
                    Text(ExpenseCategories.getCategoryEmoji(category)),
                    const SizedBox(width: 8),
                    Text(category),
                  ],
                ),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedCategory = value;
        });
        widget.onChanged(value);
      },
      validator: widget.validator,
    );
  }
}
