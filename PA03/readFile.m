% Input: A fileName to be read, and punctuations to be considered. The dataType
% of punctuations should be 'cell'.
% Output: All the unique words as a cellarray.
function out = readFile(fileName, punctuations)
    if ~isfile(fileName)
        error('File does not exist!')
    end
    fileDir = dir(fileName);
    if fileDir.bytes == 0
        error('File is empty!');
    end
    if ~isa(punctuations, 'cell')
        error('The input ''punctuations'' should be cell type.');
    end

    fid = fopen(fileName, 'r');
    words = {};
    tline = fgetl(fid);
    seperators = [setdiff(punctuations, '''') ' '];    % Ignore apostrophe when spliting strings. Always condiser space as a seperator.
    while ischar(tline)
        split = strsplit(tline, seperators);
        words = [words split];  %#ok<AGROW>
        tline = fgetl(fid);
    end
    fclose(fid);
    
    words = unique(lower(strtrim(words)));  % Ignore blanks, capital cases and duplicates.
    if any(ismember(punctuations, '''')) % Remove apostrophe if it is not in middle of a string.
        words = unique(regexprep(words, '^''+|''+$', ''));
    end
    if isempty(words{1})    % Remove the empty element.
        words(1) = [];
    end
    words(cellfun(@(x) ~isnan(str2double(x)), words)) = []; % Remove digits.
    out = words;
end