class BankAccount {
  String accountHolder;
  double balance;

  BankAccount(this.accountHolder, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid deposit amount.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else if (amount > balance) {
      print('Insufficient funds.');
    } else {
      print('Invalid withdrawal amount.');
    }
  }

  void displayBalance() {
    print('Account Holder: $accountHolder');
    print('Balance: \$${balance.toStringAsFixed(2)}');
  }
}

class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(String accountHolder, double balance, this.interestRate)
      : super(accountHolder, balance);

  void applyInterest() {
    double interest = balance * (interestRate / 100);
    balance += interest;
    print('Interest Applied: \$${interest.toStringAsFixed(2)}');
  }
}

class CheckingAccount extends BankAccount {
  double overdraftLimit;

  CheckingAccount(String accountHolder, double balance, this.overdraftLimit)
      : super(accountHolder, balance);

  @override
  void withdraw(double amount) {
    if (amount > 0 && amount <= balance + overdraftLimit) {
      balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else if (amount > balance + overdraftLimit) {
      print('Exceeds overdraft limit.');
    } else {
      print('Invalid withdrawal amount.');
    }
  }
}

void displmaninbaalanacecidoeain() {
  final savingsAccount = SavingsAccount('Alice', 1000.0, 2.5);
  final checkingAccount = CheckingAccount('Bob', 500.0, 100.0);

  savingsAccount.displayBalance();
  savingsAccount.deposit(200.0);
  savingsAccount.applyInterest();
  savingsAccount.withdraw(300.0);
  savingsAccount.displayBalance();

  checkingAccount.displayBalance();
  checkingAccount.withdraw(600.0);
  checkingAccount.displayBalance();
}
