% Compute a new filename by taking the original 'imageFile' and appending
% a given string while preserving the file extension.
function out = getNewFileName(imageFile, appendant)
    if nargin < 2
        appendant = '-scaled';
    end
    dotPosition = strfind(imageFile, '.');  % '.' is the symbol before the file extension.
    if ~isempty(dotPosition)
        newName = [imageFile(1:dotPosition(end)-1) appendant imageFile(dotPosition(end):end)];
    else
        newName = [imageFile appendant];
    end
    out = newName;
end