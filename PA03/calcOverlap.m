% Input: Names of two files to be read, and punctuations to be considered. The dataType
% of punctuations should be 'cell'.
% Output: Number of unique words in each file; Number of unique words in common; Percent overlap of each file.
function [numFile1, numFile2, numCommon, percentOverlap1, percentOverlap2] = calcOverlap(fileName1, fileName2, punctuations)
    if nargin < 2 || nargin > 3
        error('Input Error!');
    elseif nargin < 3
        punctuations = {'.','"',',','?','!','-',':','*','(',')',';','%','#','$','/','\',''''};
    end
    
    words1 = readFile(fileName1, punctuations);
    words2 = readFile(fileName2, punctuations);
    common = intersect(words1, words2);
    numFile1 = length(words1);
    numFile2 = length(words2);
    numCommon = length(common);
    percentOverlap1 = numCommon/numFile1 * 100;
    percentOverlap2 = numCommon/numFile2 * 100;
end