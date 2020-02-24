% SavingsAccount class
classdef SavingsAccount < Account
    
    properties(Constant)
        MIN_AMOUNT = 25;
        INTEREST = 0.02;
        TRANSACTION_LIMIT = 6;
    end
    
    properties (Access = private)
        transactionNum;
    end
    
    methods
        function this = SavingsAccount(amnt)
            if nargin < 1
                amnt = SavingsAccount.MIN_AMOUNT;
            elseif amnt < SavingsAccount.MIN_AMOUNT
                error('Savings:NotEnoughOpenning', 'The money is not enought to open an account!');
            end
            this = this@Account(amnt);
            this.transactionNum = 0;
        end 
        
        function out = getTransNum(this)
            out = this.transactionNum;
        end
  
        function deposit(this, amnt, desc)
            if this.transactionNum >= SavingsAccount.TRANSACTION_LIMIT
                error('Savings:NotEnoughTransaction', 'You don''t have enough transaction chance this month!');
            end
            deposit@Account(this, amnt, desc);
            this.transactionNum = this.transactionNum + 1;
        end
        
        function withdraw(this, amnt, desc)
            if this.transactionNum >= SavingsAccount.TRANSACTION_LIMIT
                error('Savings:NotEnoughTransaction', 'You don''t have enough transaction chance this month!');
            end
            if this.getBalance() - amnt < SavingsAccount.MIN_AMOUNT
                error('Savings:NotEnoughBalance', 'There is not enough available balance in your account!');
            end
            withdraw@Account(this, amnt, desc);
            this.transactionNum = this.transactionNum + 1;
        end
        
        function nextMonth(this)
            nextMonth@Account(this);
            this.transactionNum = 0;
            interest = this.balance * SavingsAccount.INTEREST;
            this.totalInterest = this.totalInterest + interest;
            this.balance = this.balance + interest;
        end
        
        function disp(this)
            disp@Account(this, 'Savings');
        end
    end
end