nums = readFile('dataset2/SN_d_tot_V2.0.csv', 5, ';');
freq = calcFrequency(nums);
printTable(freq);