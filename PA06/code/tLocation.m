% Unit tests for Location
classdef tLocation < matlab.unittest.TestCase
    
    methods(Test)
        function testDefaultConstructor(this)
            loc = Location();
            this.verifyNotEmpty(loc);
            this.verifyEqual(loc.x, 0);
            this.verifyEqual(loc.y, 0);
        end
        function testDefaultConstructor2(this)
            loc = Location(15, 25);
            this.verifyNotEmpty(loc);
            this.verifyEqual(loc.x, 15);
            this.verifyEqual(loc.y, 25);
        end
        
        function testDistanceTo(this)
            loc1 = Location(10, 20);
            loc2 = Location(13, 24);
            actual = loc1.distanceTo(loc2);
            expect = 5;
            this.verifyEqual(actual, expect);
        end
        
        function testDistanceToLine(this)
            start_loc = Location(15,6);
            loc1 = Location(10, 20);
            loc2 = Location(20, 20);
            actual = start_loc.distanceToLine(loc1, loc2);
            expect = 14;
            this.verifyEqual(actual, expect);
        end
    end
end