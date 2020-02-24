% Unit tests for ObervationAgent2
classdef tObervationAgent2 < matlab.unittest.TestCase
    
    methods(Test)
        function testDefaultConstructor(this)
            obs = ObservationAgent2();
            this.verifyNotEmpty(obs);
            this.verifyEqual(obs.loc.x, 0);
            this.verifyEqual(obs.loc.y, 0);
        end
        
        function testGradientColor(this)
            obs = ObservationAgent2();
            actual = obs.gradientColor(1, 5);
            expect = 0.8;
            this.verifyEqual(actual, expect);
        end
        function testGradientColor2(this)
            obs = ObservationAgent2();
            actual = obs.gradientColor(-1, 5);
            expect = 0;
            this.verifyEqual(actual, expect);
        end
        function testGradientColor3(this)
            obs = ObservationAgent2();
            actual = obs.gradientColor(2, 0);
            expect = 0;
            this.verifyEqual(actual, expect);
        end
    end
end