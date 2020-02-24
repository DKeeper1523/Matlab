% Given a plate string, return a string corresponding to the serial format 
% of that plate.
function out = getSerial(plate)
    isLetter = isletter(plate);
    countN = double('1');
    countC = double('A');
    for i = 1:length(plate)
        if isLetter(i)
            plate(i) = char(countC);
            countC = countC + 1;
        else
            plate(i) = char(countN);
            countN = countN + 1;
        end
    end
    out = plate;
end
