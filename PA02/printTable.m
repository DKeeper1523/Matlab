function out = printTable(freq)
    First_Digit = (1:length(freq)).';
    Frequency = strcat(num2str(freq.' * 100),'%');
    out = table(First_Digit, Frequency);
    disp(out)
end