% Get user's input, and print out the result.
function main()
    fprintf('This program compares two text files and reports the number of words in common and the percent overlap.\n');
    fileName1 = input('file #1 name? ','s');
    fileName2 = input('file #2 name? ','s');
    
    % tic
    [numFile1, numFile2, numCommon, percentOverlap1, percentOverlap2] = calcOverlap(fileName1, fileName2);
    fprintf('file #1 words = %d\n', numFile1);
    fprintf('file #2 words = %d\n', numFile2);
    fprintf('common words = %d\n', numCommon);
    fprintf('%% of file 1 in overlap = %f\n', percentOverlap1);
    fprintf('%% of file 2 in overlap = %f\n', percentOverlap2);
    % timecost = toc
end