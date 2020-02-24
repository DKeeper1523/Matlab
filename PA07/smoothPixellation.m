% Use the pixels around and compute the right color by averaging.
function out = smoothPixellation(input)
    [h, w, c] = size(input);
    input = int32(input);
    newImg = zeros(h, w, c);
    for i = 1:h
        for j = 1:w
            sum = input(i, j, :) + input(max(i - 1, 1), j, :) + input(min(i + 1, h), j, :) + input(i, max(j - 1, 1), :) + input(i, min(j + 1, w), :);
            newImg(i, j, :) = sum / 5; % Calculate the average of seft, top, bottom, left and right.
        end
    end
    out = uint8(newImg);
end