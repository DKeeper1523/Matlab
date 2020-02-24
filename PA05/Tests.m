% Unit tests
function tests = Tests()
    tests = functiontests(localfunctions);
end

function test_readFile(testCase)
    actual = readFile('test1.txt');
    expected = {'all', 'and', 'bus', 'go', 'on', 'round', 'the', 'through', 'town', 'wheels'};
    verifyEqual(testCase, actual, expected);
end

function test_readFileError(testCase)
    verifyError(testCase, @() readFile('test3.txt'), 'ReadFile:FileEmpty');
end

function test_readFileError2(testCase)
    verifyError(testCase, @() readFile('test4.txt'), 'ReadFile:FileNotExist');
end

function test_calcOverlap(testCase)
    [actual1, actual2, actual3, actual4, actual5] = calcOverlap('test1.txt', 'test2.txt');
    [expected1, expected2, expected3, expected4, expected5] = deal(10, 9, 7, 70, 7/9*100);
    verifyEqual(testCase, [actual1, actual2, actual3, actual4, actual5], [expected1, expected2, expected3, expected4, expected5]);
end

function test_calcOverlapError(testCase)
    verifyError(testCase, @() calcOverlap('test1.txt'), 'Calc:InputError');
end