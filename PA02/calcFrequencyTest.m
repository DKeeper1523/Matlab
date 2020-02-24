actual1 = calcFrequency({'1', '2', '3', '63', '123', '87', '7', '4', '3', '341'});
expected1 = [0.2, 0.1, 0.3, 0.1, 0, 0.1, 0.1, 0.1, 0];
assert(length(actual1) == length(expected1), "calcFrequency length1 error");
for i = 1:length(actual1)
    assert(prod(actual1(i) == expected1(i)) == 1, "calcFrequency calculation1 error");
end


actual2 = calcFrequency({'3', '6', '-1', '5', '35', '235', '35', '0', '41', '24'});
expected2 = [0, 0.25, 0.375, 0.125, 0.125, 0.125, 0, 0, 0];
assert(length(actual2) == length(expected2), "calcFrequency length2 error");
for i = 1:length(actual2)
    assert(prod(actual2(i) == expected2(i)) == 1, "calcFrequency calculation2 error");
end