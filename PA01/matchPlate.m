function out = matchPlate(partial, plates)
    result = {};
    for i = 1:length(plates)
        if isMatch(partial, plates{i})
            result{end+1} = plates{i};
        end
    end
    out = result;
end

function flag = isMatch(partial, plate)
    count = length(partial); % number of chars unmatched in partial
    i = 1; % pointer in plate
    j = 1; % pointer in partial
    start = 1; % pointer recording the start matching position in plate
    while i <= length(plate) && j <= length(partial) && start <= (length(plate) - length(partial) + 2)
        if partial(j) == '-'
            count = count - 1;
            j = j + 1;
        elseif partial(j) == plate(i)
            if j == 1
                start = i;
            end
            count = count - 1;
            j = j + 1;
            i = i + 1;
        elseif i == length(plate) && count > 0
            count = length(partial);
            j = 1;
            start = start + 1;
            i = start;
        else
            i = i + 1;
        end
    end
    if count == 0
        flag = 1;
    else
        flag = 0;
    end
end