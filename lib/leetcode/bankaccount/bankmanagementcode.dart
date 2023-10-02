import 'dart:io';
import 'dart:math';


class Transaction {
  String description;
  double amount;

  Transaction(this.description, this.amount);
}



String longestCommonSubsequence(String text1, String text2) {
  int m = text1.length;
  int n = text2.length;

  // Create a 2D table to store the length of the common subsequence
  List<List<int>> dp = List.generate(m + 1, (i) => List<int>.filled(n + 1, 0));

  // Populate the DP table
  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (text1[i - 1] == text2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1;
      } else {
        dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
      }
    }
  }

  // Reconstruct the longest common subsequence
  int i = m, j = n;
  String result = '';
  while (i > 0 && j > 0) {
    if (text1[i - 1] == text2[j - 1]) {
      result = text1[i - 1] + result;
      i--;
      j--;
    } else if (dp[i - 1][j] > dp[i][j - 1]) {
      i--;
    } else {
      j--;
    }
  }

  return result;
}

void main() {
  String text1 = "abcde";
  String text2 = "ace";
  String lcs = longestCommonSubsequence(text1, text2);
  print("Longest Common Subsequence: $lcs"); // Output: "ace"
}

class BankAccount {
  final String accountNumber;
  final String accountHolder;
  double balance;
  final List<Transaction> transactions = [];

  BankAccount(this.accountHolder, double initialBalance)
      : accountNumber = 'AC${accountCounter++}',
        balance = initialBalance;
 static int accountCounter = 1;

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      transactions.add(Transaction('Deposit', amount));
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid deposit amount.');
    }
  }

  bool withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      transactions.add(Transaction('Withdrawal', amount));
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
      return true;
    } else {
      print('Withdrawal failed. Insufficient funds or invalid amount.');
      return false;
    }
  }

  double calculateInterest(double interestRate) {
    final interest = balance * (interestRate / 100);
    balance += interest;
    transactions.add(Transaction('Interest', interest));
    return interest;
  }

  void displayBalance() {
    print('Account Number: $accountNumber');
    print('Account Holder: $accountHolder');
    print('Balance: \$${balance.toStringAsFixed(2)}');
  }

  void displayTransactions() {
    print('Transaction History for Account $accountNumber:');
    for (var transaction in transactions) {
      print(
          '${transaction.description}: \$${transaction.amount.toStringAsFixed(2)}');
    }
  }
}

class Bank {

  final List<BankAccount> accounts = [];

  BankAccount createAccount(String accountHolder, double initialBalance) {
    final account = BankAccount(accountHolder, initialBalance);
    accounts.add(account);
    return account;
  }

  BankAccount findAccount(String accountNumber) {
    return accounts.firstWhere(
      (account) => account.accountNumber == accountNumber,
    );
  }

  void run() {
    while (true) {
      print('\nBanking System Menu:');
      print('1. Create Customer Account');
      print('2. Deposit');
      print('3. Withdraw');
      print('4. Check Balance');
      print('5. Calculate Interest');
      print('6. Display Transactions');
      print('7. Exit');
      print('Enter your choice:');

      final choice = int.tryParse(stdin.readLineSync() ?? '');

      switch (choice) {
        case 1:
          print('Enter customer name:');
          final customerName = stdin.readLineSync() ?? '';
          print('Enter initial balance:');
          final initialBalance =
              double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
          createAccount(customerName, initialBalance);
          print('Customer account created.');
          break;

        case 2:
          // Deposit logic
          break;

        case 3:
          // Withdrawal logic
          break;

        case 4:
          // Check balance logic
          break;

        case 5:
          // Calculate interest logic
          break;

        case 6:
          // Display transactions logic
          break;

        case 7:
          print('Exiting...');
          exit(0);
          break;

        default:
          print('Invalid choice. Please select a valid option.');
      }
    }
  }
}
void masskssksin() {
  List<int> numbers = [1, 5, 3, 8, 2, 7];

  int maxNumber = numbers.reduce((max, currentNumber) => max > currentNumber ? max : currentNumber);

  print('The maximum number in the list is: $maxNumber');
}
