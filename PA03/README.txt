file1.txt: Japanese Fairy Tales
http://www.gutenberg.org/ebooks/4018
file2.txt: American Fairy Tales
http://www.gutenberg.org/ebooks/4357


Run 'main' in command line, then type 'file1.txt' and 'file2.txt', you can get the output:

This program compares two text files and reports the number of words in common and the percent overlap.
file #1 name? file1.txt
file #2 name? file2.txt
file #1 words = 5569
file #2 words = 4483
common words = 2682
% of file 1 in overlap = 48.159454
% of file 2 in overlap = 59.826009



Analysis:
The first file is Japanese Fairy Tales, and the second one is American Fairy Tales. From the result, we can see that there's a big overlap between these two books. Instead of plagiarism, I think there are two reasons that might lead to this result:

1. The fairy tales are always written for children, so the authors tend to use simple words in books.
2. People all over the world have similar senses about life, so fairy tales from different areas are expressing similar opinions, which explains the similarity in vocabulary.



Extra:
To make the program run faster, I changed the order of doing cell construction, strtrim, lower and unique.
At first I did strtrim, lower and unique immediately after strsplit, then constructed the word cell. The runtime was more than 300s.
Now I constructed the word cell after strsplit. After getting the whole cell, I did strtrim, lower and unique to the cell. The runtime is less than 50s.