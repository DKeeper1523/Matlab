% Input: Names of two files to be read
% Output: Number of unique words in each file; Number of unique words in common; Percent overlap of each file.
function [numFile1, numFile2, numCommon, percentOverlap1, percentOverlap2] = calcOverlap(fileName1, fileName2)
    if nargin ~= 2
        error('Calc:InputError', 'Input Error!');
    end
    
    words1 = readFile(fileName1);
    words2 = readFile(fileName2);
    common = intersect(words1, words2);
    numFile1 = length(words1);
    numFile2 = length(words2);
    numCommon = length(common);
    percentOverlap1 = numCommon/numFile1 * 100;
    percentOverlap2 = numCommon/numFile2 * 100;
end