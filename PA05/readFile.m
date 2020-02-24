% Input: A fileName to be read
% Output: All the unique words as a cellarray.
function out = readFile(fileName)
    if ~isfile(fileName)
        error('ReadFile:FileNotExist', 'File does not exist!')
    end
    fileDir = dir(fileName);
    if fileDir.bytes == 0
        error('ReadFile:FileEmpty', 'File is empty!');
    end

    fid = fopen(fileName, 'r');
    words = {};
    tline = fgetl(fid);
    seperators = {'.','"',',','?','!','-',':','*','(',')',';','%','#','$','/','\',' '}; % some default seperators
    while ischar(tline)
        split = strsplit(tline, seperators);
        words = [words split];  %#ok<AGROW>
        tline = fgetl(fid);
    end
    fclose(fid);
    
    words = unique(lower(strtrim(words)));  % Ignore blanks, capital cases and duplicates.
    words = unique(regexprep(words, '^''+|''+$', ''));
    if isempty(words{1})    % Remove the empty element.
        words(1) = [];
    end
    words(cellfun(@(x) ~isnan(str2double(x)), words)) = []; % Remove digits.
    out = words;
end