actual1 = readFile('test1.txt', {});
expected1 = {'all', 'and', 'bus', 'go', 'on', 'round', 'round.', 'the', 'through', 'town.', 'wheels'};
assert(isequal(actual1, expected1))


actual2 = readFile('test1.txt', {'.','"',',','?','!','-',':','*','(',')',';','%','#','$','/','\',''''});
expected2 = {'all', 'and', 'bus', 'go', 'on', 'round', 'the', 'through', 'town', 'wheels'};
assert(isequal(actual2, expected2))


try
    actual3 = readFile('test3.txt', {});
catch expected3
    assert(isequal(expected3.message, 'File does not exist!'))
end