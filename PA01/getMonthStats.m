% Given an array of plate strings, 
% return an array of floats corresponding to the frequen-cy percentage of each expiration month.
function out = getMonthStats(plates)
    result = [0,0,0,0,0,0,0,0,0,0];
    len = length(plates{1});
    for i = 1:length(plates)
        month = str2double(plates{i}(len));
        if month == 0
            month = 10;
        end
        result(month) = result(month) + 1;
    end
    out = result/length(plates);
end