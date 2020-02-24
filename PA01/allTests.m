% INSTRUCTIONS: Run the tests using:
% > runtests allTests
function tests = allTests()
    tests = functiontests(localfunctions);
end

function test_nextPlate1(testCase)
    actual = nextPlate('215BG2');
    expected = '215BG3';
    verifyEqual(testCase, actual, expected);
end

function test_nextPlate2(testCase)
    % TODO: Define another unit test for 'nextPlate'
    actual = nextPlate('999ZZ9');
    expected = 'error';
    verifyEqual(testCase, actual, expected);
end

function test_getSerial1(testCase)
    actual = getSerial('215BG2');
    expected = '123AB4';
    verifyEqual(testCase, actual, expected);
end

function test_getSerial2(testCase)
    % TODO: Define another unit test for getSerial
    actual = getSerial('15BG22');
    expected = '12AB34';
    verifyEqual(testCase, actual, expected);
end

function test_getMonthStats(testCase)
    % We use a cell array of character vectors
    plates = {'215BG2', '399ZZ2', '399ZZ3', '1ABC21'};

    actual = getMonthStats(plates); 
    expected = [0.25, 0.5, 0.25, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    
    verifyEqual(testCase, actual, expected);
end

% Read the license plates from file
function test_getMonthStatsFromFile(testCase)
    plates = readPlates('plates.txt');
    
    actual = getMonthStats(plates); 
    
    expected = [0.1040, 0.0440, 0.1515, 0.1165, 0.0425, 0.0925, 0.0980, 0.0875, 0.0120, 0.2515];
    
    verifyEqual(testCase, actual, expected);
end

function test_matchPlate1(testCase)

    partial = '39-Z3';
    plates = {'215BG2', '399ZZ2', '399ZZ3', '1LLC21'};

    actual = matchPlate(partial, plates);
    expected = {'399ZZ3'};

    verifyLength(testCase, actual, 1);
    verifyEqual(testCase, actual{1}, expected{1});
end

function test_matchPlate2(testCase)

    plates = {'215BG2', '399ZZ2', '399ZZ3', '1LLC21'};
    partial = '39-ZZ';
    actual = matchPlate(partial, plates);
    
    expected = {'399ZZ2', '399ZZ3'};

    verifyLength(testCase, actual, 2);
    verifyEqual(testCase, actual{1}, expected{1});
    verifyEqual(testCase, actual{2}, expected{2});
end

