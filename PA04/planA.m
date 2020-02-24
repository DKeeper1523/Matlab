% Plan A: You open only checking account

checking = CheckingAccount();
checking.deposit(1000.00, "Income Jan.");
checking.withdraw(500.00, "Rent Jan.");
checking.nextMonth();
checking.deposit(1000.00, "Income Feb.");
checking.withdraw(500.00, "Rent Feb.");
checking.nextMonth();
checking.withdraw(500.00, "Rent Mar.");
checking.nextMonth();
checking.withdraw(500.00, "Rent Apr.");
checking.nextMonth();

%
% 
% Output: in Plan A, total funds across all accounts are:
totalFunds = checking.getBalance();
disp("totalFunds: " + totalFunds)
disp(checking)