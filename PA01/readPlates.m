% Read contents of fileName text file, and 
% and return as a cell array of character vectors
function out = readPlates(fileName)

    fid = fopen(fileName, 'r');

    tlines = {};

    tline = fgetl(fid);
    while ischar(tline)
        tlines{end+1} = tline; %#ok<AGROW>
        tline = fgetl(fid);
    end
    fclose(fid);
    
    out = tlines;
    
    % Convert to row vector
    %out = char(tlines);
end
