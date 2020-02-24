actual1 = readFile('test.txt', 1, '\t');
expected1 = {'1', '2', '3', '63', '123', '87', '7', '4', '3', '341'};
assert(length(actual1) == length(expected1), "readFile length1 error");
for i = 1:length(actual1)
    assert(prod(actual1{i} == expected1{i}) == 1, "readFile string1 error");
end


actual2 = readFile('test.txt', 2, '\t');
expected2 = {'3', '6', '-1', '5', '35', '235', '35', '0', '41', '24'};
assert(length(actual2) == length(expected2), "readFile length2 error");
for i = 1:length(actual2)
    assert(prod(actual2{i} == expected2{i}) == 1, "readFile string2 error");
end