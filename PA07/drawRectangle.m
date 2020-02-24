% Draw a rectangle on img with the given top-left corner position and
% bottom-right corner position
function out = drawRectangle(img, startR, startC, endR, endC)
    for i = startR:endR
        img(i, startC, :) = 0;  % (0, 0, 0) is black.
        img(i, endC, :) = 0;
    end
    for i = startC:endC
        img(startR, i, :) = 0;
        img(endR, i, :) = 0;
    end
    out = img;
end