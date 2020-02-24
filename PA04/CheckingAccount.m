% CheckingAccount class
classdef CheckingAccount < Account
    
    properties(Constant)
        OPEN_AMOUNT = 200;
        MONTH_FEE = 5;
        PENALTY_FEE = 50;
        PENALTY_FEE_LINE = 0;
        MIN_AMOUNT = -100;
    end
    
    methods
        function this = CheckingAccount(amnt)
            if nargin < 1
                amnt = CheckingAccount.OPEN_AMOUNT;
            elseif amnt < CheckingAccount.OPEN_AMOUNT
                error('Checking:NotEnoughOpenning', 'The money is not enought to open an account!');
            end
            this = this@Account(amnt);
        end 
  
        function withdraw(this, amnt, desc)
            if this.getBalance() - amnt < CheckingAccount.MIN_AMOUNT
                error('Checking:NotEnoughBalance', 'There is not enough balance in your account!');
            end
            withdraw@Account(this, amnt, desc);
        end
        
        function nextMonth(this)
            nextMonth@Account(this);
            if this.getBalance() < CheckingAccount.PENALTY_FEE_LINE
                this.balance = this.balance - CheckingAccount.PENALTY_FEE;
                this.totalFees = this.totalFees + CheckingAccount.PENALTY_FEE;
            elseif this.getBalance() < CheckingAccount.OPEN_AMOUNT
                this.balance = this.balance - CheckingAccount.MONTH_FEE;
                this.totalFees = this.totalFees + CheckingAccount.MONTH_FEE;
            end
        end
        
        function disp(this)
            disp@Account(this, 'Checking');
        end
    end
end