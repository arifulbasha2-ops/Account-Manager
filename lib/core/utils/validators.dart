class Validators {
  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
  
  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }
    final amount = double.tryParse(value);
    if (amount == null) {
      return 'Please enter a valid amount';
    }
    if (amount <= 0) {
      return 'Amount must be greater than 0';
    }
    return null;
  }
  
  static String? validateAccountName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account name is required';
    }
    if (value.length < 2) {
      return 'Account name must be at least 2 characters';
    }
    return null;
  }
  
  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description is required';
    }
    if (value.length < 3) {
      return 'Description must be at least 3 characters';
    }
    return null;
  }
  
  static String? validatePersonName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Person name is required';
    }
    if (value.length < 2) {
      return 'Person name must be at least 2 characters';
    }
    return null;
  }
  
  static String? validateAccountSelection(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an account';
    }
    return null;
  }
  
  static String? validateCategorySelection(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }
  
  static String? validateTransferAccounts(String? fromAccount, String? toAccount) {
    if (fromAccount == null || fromAccount.isEmpty) {
      return 'Please select source account';
    }
    if (toAccount == null || toAccount.isEmpty) {
      return 'Please select destination account';
    }
    if (fromAccount == toAccount) {
      return 'Source and destination accounts must be different';
    }
    return null;
  }
}
