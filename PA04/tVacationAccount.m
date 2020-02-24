% Unit tests for VacationAccount
classdef tVacationAccount < matlab.unittest.TestCase
    
    methods(Test)
        function testDefaultConstructor(this)
            vacay = VacationAccount();
            this.verifyNotEmpty(vacay);
            this.verifyEqual(vacay.getBalance(), VacationAccount.MIN_AMOUNT);
        end
        function testParameterConstructor(this)
            amnt = 300;
            vacay = VacationAccount(amnt);
            this.verifyNotEmpty(vacay);
            this.verifyEqual(vacay.getBalance(), amnt);
        end
        function testVerifyErrorConstructor(this)
            this.verifyError( @() VacationAccount(-5), 'Vacation:NotEnoughOpenning');
        end
        
        function testVerifyErrorDeposit(this)
            vacay = VacationAccount(500);
            for i = 1:Account.SEMESTER
                vacay.nextMonth();
            end
            vacay.withdraw('Blah')
            this.verifyError( @() vacay.deposit(100, 'Blah'), 'Vacation:Closed');
        end
        
        function testWithdraw(this)
            vacay = VacationAccount(500);
            for i = 1:Account.SEMESTER
                vacay.nextMonth();
            end
            vacay.withdraw('Blah')
            this.verifyEqual(vacay.getBalance(), 0);
            this.verifyEqual(vacay.getState(), 0);
        end
        function testVerifyErrorWithdraw(this)
            vacay = VacationAccount(500);
            this.verifyError( @() vacay.withdraw('Blah'), 'Vacation:NotEndOfSemester');
        end
        
        function testVerifyErrorTransferTo(this)
            vacay = VacationAccount(500);
            chk = CheckingAccount();
            this.verifyError( @() vacay.transferTo(chk, 50, 'Blah'), 'Vacation:TransferNotAllowed');
        end
        
        function testNextMonth(this)
            vacay = VacationAccount(100);
            vacay.nextMonth()
            this.verifyEqual(vacay.getTotalInterest(), 10);  % Verify Interest
            this.verifyEqual(vacay.getBalance(), 110);
        end
    end
end