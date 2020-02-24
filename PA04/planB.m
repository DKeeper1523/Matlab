% Plan B: In addition to opening checking account, you open savings account

checking = CheckingAccount();

savings = SavingsAccount();
checking.transferTo(savings, 200.00);

checking.deposit(1000.00, "Income Jan.");
checking.withdraw(500.00, "Rent Jan.");
checking.nextMonth();
savings.nextMonth();
checking.deposit(1000.00, "Income Feb.");
checking.withdraw(500.00, "Rent Feb.");
checking.nextMonth();
savings.nextMonth();
checking.withdraw(500.00, "Rent Mar.");
checking.nextMonth();
savings.nextMonth();
checking.withdraw(500.00, "Rent Apr.");
checking.nextMonth();
savings.nextMonth();

% Output: in Plan B, total funds across all accounts are:
totalFunds = checking.getBalance() + savings.getBalance();
disp("totalFunds: " + totalFunds)
disp(checking)
disp(savings)