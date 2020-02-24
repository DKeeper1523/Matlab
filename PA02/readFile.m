function out = readFile(fileName, row, separator)
    fid = fopen(fileName, 'r');
    tlines = {};
    tline = fgetl(fid);
    while ischar(tline)
        split = strsplit(tline, separator);
        tlines{end+1} = strtrim(split{1, row});
        tline = fgetl(fid);
    end
    fclose(fid);
    out = tlines;
end