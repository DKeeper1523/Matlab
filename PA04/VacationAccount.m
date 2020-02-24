% VacationAccount class
classdef VacationAccount < Account
    
    properties(Constant)
        MIN_AMOUNT = 0;
        INTEREST = 0.1;
    end
    
    properties (Access = private)
        isActive;
    end
    
    methods
        function this = VacationAccount(amnt)
            if nargin < 1
                amnt = VacationAccount.MIN_AMOUNT;
            elseif amnt < VacationAccount.MIN_AMOUNT
                error('Vacation:NotEnoughOpenning', 'The money is not enought to open an account!');
            end
            this = this@Account(amnt);
            this.isActive = 1;
        end 
        
        function out = getState(this)
            out = this.isActive;
        end
        
        function deposit(this, amnt, desc)
            if ~this.isActive
                error('Vacation:Closed', 'Your account has been closed!');
            end
            deposit@Account(this, amnt, desc);
        end
        
        function withdraw(this, desc)
            if this.month < Account.SEMESTER
                error('Vacation:NotEndOfSemester', 'You cannot withdraw your balance until end of the semester!')
            end
            withdraw@Account(this, this.balance, desc);
            this.isActive = 0;
        end
        
        function nextMonth(this)
            nextMonth@Account(this);
            if this.isActive && this.balance
                interest = this.balance * VacationAccount.INTEREST;
                this.totalInterest = this.totalInterest + interest;
                this.balance = this.balance + interest;
            end
        end
        
        function transferTo(~, ~, ~, ~)
            error('Vacation:TransferNotAllowed', 'You are not allowed to transfer money to other accounts!');
        end
        
        function disp(this)
            disp@Account(this, 'Vacation');
        end
    end
end