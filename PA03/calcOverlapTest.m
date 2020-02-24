[actual1, actual2, actual3, actual4, actual5] = calcOverlap('test1.txt', 'test2.txt');
[expected1, expected2, expected3, expected4, expected5] = deal(10, 9, 7, 70, 7/9*100);
assert(actual1==expected1 && actual2==expected2 && actual3==expected3 && actual4==expected4 && actual5==expected5)


try
    actual6 = calcOverlap('test1.txt');
catch expected6
    assert(isequal(expected6.message, 'Input Error!'))
end