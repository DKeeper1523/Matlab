function out = calcFrequency(nums)
    count = zeros(1, 9);
    for i = 1:length(nums)
        number = str2double(nums{i}(1));
        if ~isnan(number) && number > 0
            count(number) = count(number) + 1;
        end
    end
    out = count/sum(count);
end