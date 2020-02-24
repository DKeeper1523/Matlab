% Unit tests for SavingsAccount
classdef tSavingsAccount < matlab.unittest.TestCase
    
    methods(Test)
        function testDefaultConstructor(this)
            savings = SavingsAccount();
            this.verifyNotEmpty(savings);
            this.verifyEqual(savings.getBalance(), SavingsAccount.MIN_AMOUNT);
        end
        function testParameterConstructor(this)
            amnt = 300;
            savings = SavingsAccount(amnt);
            this.verifyNotEmpty(savings);
            this.verifyEqual(savings.getBalance(), amnt);
        end
        function testVerifyErrorConstructor(this)
            this.verifyError( @() SavingsAccount(20), 'Savings:NotEnoughOpenning');
        end
        
        function testVerifyErrorWithdraw(this)
            savings = SavingsAccount(500);
            this.verifyError( @() savings.withdraw(480, 'Blah'), 'Savings:NotEnoughBalance');
            for i = 1:SavingsAccount.TRANSACTION_LIMIT
                savings.withdraw(50, 'Blah');
            end
            this.verifyError( @() savings.withdraw(50, 'Blah'), 'Savings:NotEnoughTransaction');
        end
        
        function testNextMonth(this)
            savings = SavingsAccount(800);
            for i = 1:SavingsAccount.TRANSACTION_LIMIT
                savings.withdraw(50, 'Blah');
            end
            savings.nextMonth()
            savings.withdraw(50, 'Blah');  % Verify Transaction limit
            this.verifyEqual(savings.getTotalInterest(), 10);  % Verify Interest
            this.verifyEqual(savings.getBalance(), 460);
        end
    end
end