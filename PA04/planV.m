%Plan V: In addition to checking and savings accounts, you open vacation account
checking = CheckingAccount();

savings = SavingsAccount();
checking.transferTo(savings, 200.00);

vacay = VacationAccount();
vacay.deposit(50.00, 'Birthday gift from parents');
checking.transferTo(vacay, 25.00);
savings.transferTo(vacay, 200.00);

checking.deposit(1000.00, "Income Jan.");
checking.withdraw(500.00, "Rent Jan.");
checking.nextMonth();
savings.nextMonth();
vacay.nextMonth();
checking.deposit(1000.00, "Income Feb.");
checking.withdraw(500.00, "Rent Feb.");
checking.nextMonth();
savings.nextMonth();
vacay.nextMonth();
checking.withdraw(500.00, "Rent Mar.");
checking.nextMonth();
savings.nextMonth();
vacay.nextMonth();
checking.withdraw(500.00, "Rent Apr.");
checking.nextMonth();
savings.nextMonth();
vacay.nextMonth();

% Output: in Plan V, total funds across all accounts are:
totalFunds = checking.getBalance() + savings.getBalance() + vacay.getBalance();
disp("totalFunds: " + totalFunds)
disp(checking)
disp(savings)
disp(vacay)