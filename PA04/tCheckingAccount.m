% Unit tests for CheckingAccount & Account
classdef tCheckingAccount < matlab.unittest.TestCase
    
    methods(Test)
        function testDefaultConstructor(this)
            chk = CheckingAccount();
            this.verifyNotEmpty(chk);
            this.verifyEqual(chk.getBalance(), CheckingAccount.OPEN_AMOUNT);
        end
        function testParameterConstructor(this)
            amnt = 300;
            chk = CheckingAccount(amnt);
            this.verifyNotEmpty(chk);
            this.verifyEqual(chk.getBalance(), amnt);
        end
        function testVerifyErrorConstructor(this)
            this.verifyError( @() CheckingAccount(100), 'Checking:NotEnoughOpenning');
        end

        function testVerifyErrorDeposit(this)
            chk = CheckingAccount();
            this.verifyError( @() chk.deposit(-200, 'Blah'), 'Account:DepositNotPositive');
        end
        
        function testVerifyErrorWithdraw(this)
            chk = CheckingAccount();
            this.verifyError( @() chk.withdraw(500, 'Blah'), 'Checking:NotEnoughBalance');
        end
        
        function testTransferTo(this)
            chk1 = CheckingAccount(300);
            chk2 = CheckingAccount(200);
            chk1.transferTo(chk2, 150, '');
            this.verifyEqual(chk1.getBalance(), 150);
            this.verifyEqual(chk1.getTotalWithdrawals(), 150);
            this.verifyEqual(chk2.getBalance(), 350);
            this.verifyEqual(chk2.getTotalDeposits(), 350);
        end
        function testVerifyErrorTransferTo1(this)
            chk = CheckingAccount();
            savings = SavingsAccount();
            for i = 1:SavingsAccount.TRANSACTION_LIMIT
                savings.deposit(50,'');
            end
            this.verifyError( @() chk.transferTo(savings, 100, ''), 'Account:DestAccountLimited');
        end
        function testVerifyErrorTransferTo2(this)
            chk = CheckingAccount();
            vac = VacationAccount(100);
            for i = 1:Account.SEMESTER
                vac.nextMonth();
            end
            vac.withdraw('');
            this.verifyError( @() chk.transferTo(vac, 100, ''), 'Account:DestAccountClosed');
        end
        
        function testNextMonth(this)
            chk = CheckingAccount();
            chk.withdraw(200, 'Blah')
            chk.nextMonth()
            this.verifyEqual(chk.getBalance(), -5);  % Verify Fee
            this.verifyEqual(chk.getTotalFees(), 5);
            chk.nextMonth()
            this.verifyEqual(chk.getBalance(), -55);  % Verify Penalty
            this.verifyEqual(chk.getTotalFees(), 55);
        end
        function testSemesterNextMonth(this)
            chk = CheckingAccount(300);
            chk.withdraw(100, 'Blah')
            for i = 1:Account.SEMESTER
                chk.nextMonth();
            end
            this.verifyEqual(chk.getTotalDeposits(), 300);
            this.verifyEqual(chk.getTotalWithdrawals(), 100);
            chk.nextMonth()
            this.verifyEqual(chk.getTotalDeposits(), 0);
            this.verifyEqual(chk.getTotalWithdrawals(), 0);
        end
    end
end