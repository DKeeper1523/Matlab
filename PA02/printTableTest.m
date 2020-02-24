expected1 = [0.2, 0.1, 0.3, 0.1, 0, 0.1, 0.1, 0.1, 0];
actual1 = printTable(expected1);
assert(height(actual1) == length(expected1), "printTable length1 error");
for i = 1:height(actual1)
    assert(prod(str2double(actual1{i, 2}(1:end-1)) == expected1(i) * 100) == 1, "printTable frequency1 error");
end


expected2 = [0, 0.25, 0.375, 0.125, 0.125, 0.125, 0, 0, 0];
actual2 = printTable(expected2);
assert(height(actual2) == length(expected2), "printTable length2 error");
for i = 1:height(actual2)
    assert(prod(str2double(actual2{i, 2}(1:end-1)) == expected2(i) * 100) == 1, "printTable frequency2 error");
end