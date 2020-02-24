% Base class
classdef (Abstract) Account < handle
    
    properties(Constant)
        SEMESTER = 4;
    end
    
    properties (Access = protected)
        balance;
        totalDeposits;
        totalWithdrawals;
        totalInterest;
        totalFees;
        month;
        log;
    end
    
    methods
        function this = Account(amnt)
            if nargin < 1
                error('Account:NoInitialMoney', 'Please set an amount to open the account!')
            end
            this.balance = amnt;
            this.totalDeposits = amnt;
            this.totalWithdrawals = 0;
            this.totalInterest = 0;
            this.totalFees = 0;
            this.month = 0;
            this.log = {};
        end

        function out = getBalance(this)
            out = this.balance;
        end
        
        function out = getTotalDeposits(this)
            out = this.totalDeposits;
        end
        
        function out = getTotalWithdrawals(this)
            out = this.totalWithdrawals;
        end
        
        function out = getTotalInterest(this)
            out = this.totalInterest;
        end
        
        function out = getTotalFees(this)
            out = this.totalFees;
        end
        
        function out = getLog(this)
            out = this.log;
        end
    end
    
    methods
        function deposit(this, amnt, desc)
            if amnt <= 0
                error('Account:DepositNotPositive', 'Your deposition should be a positive number!');
            end
            this.balance = this.balance + amnt;
            this.totalDeposits = this.totalDeposits + amnt;
            this.log{end+1} = [amnt, desc];
        end
        
        function withdraw(this, amnt, desc)
            if nargin < 2 || nargin > 3
                error('Account:NumParametersWrong', 'Please input the amount and description!');
            elseif nargin < 3
                desc = '';
            end
            if amnt <= 0
                error('Account:WithdrawNotPositive', 'Your withdrowal should be a positive number!');
            end
            this.balance = this.balance - amnt;
            this.totalWithdrawals = this.totalWithdrawals + amnt;
            this.log{end+1} = [-amnt, desc];
        end
        
        function transferTo(this, destAccnt, amnt, desc)
            if nargin < 3 || nargin > 4
                error('Account:NumParametersWrong', 'Please input the amount and description!');
            elseif nargin < 4
                desc = '';
            end
            if class(destAccnt) == "SavingsAccount" && destAccnt.getTransNum() >= SavingsAccount.TRANSACTION_LIMIT
                error('Account:DestAccountLimited', 'DestAccount has no transaction chance this month!');
            end
            if class(destAccnt) == "VacationAccount" && ~destAccnt.getState()
                error('Account:DestAccountClosed', 'DestAccount is closed!');
            end
            this.withdraw(amnt, desc)
            destAccnt.deposit(amnt, desc)
        end
        
        function nextMonth(this)
            this.month = mod(this.month + 1, Account.SEMESTER + 1);
            if this.month == 0
                this.totalDeposits = 0;
                this.totalWithdrawals = 0;
                this.totalInterest = 0;
                this.totalFees = 0;
                this.month = 0;
                this.log = {};
            end
        end
        
        function disp(this, accountType)
            if ~isscalar(this)
                error('Acount:InputNotScalar', 'Please Input a scalar class!');
            else
                fprintf('%s balance: %f\n', accountType, this.balance);
                fprintf('%s totalDeposits: %f\n', accountType, this.totalDeposits);
                fprintf('%s totalWithdrawals: %f\n', accountType, this.totalWithdrawals);
                fprintf('%s totalInterest: %f\n', accountType, this.totalInterest);
                fprintf('%s totalFees: %f\n', accountType, this.totalFees);
            end
        end
    end
end
