function out = nextPlate(plate)
    isLetter = isletter(plate);
    for i = length(plate): -1: 1
        if plate(i) ~= 'Z' && plate(i) ~= '9'
            plate(i) = char(double(plate(i))+1);
            out = plate;
            break;
        elseif isLetter(i)
            plate(i) = 'A';
        elseif i ~= 1
            plate(i) = '0';
        else
            out = 'error';
        end
    end
end