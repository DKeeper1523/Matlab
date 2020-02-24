% Build rectangles changing from a small size to a large size. vg is the
% vertical offset between two consectutive rectangles, hg is the
% horizontal offset between two consectutive rectangles, and numInserted is
% the number of rectangles between the smallest one and the largest one.
function out = buildImage(rmin, cmin, rmax, cmax, vg, hg, numInserted)
    if nargin < 7
        numInserted = 19;
    end
    START_ROW = 1; % Row index where to start drawing the top-left corner of the smallest rectangle.
    START_COLUMN = 1; % Column index where to start drawing the top-left corner of the smallest rectangle.
    
    height = rmax + (numInserted + 1) * vg + START_ROW - 1;
    width = cmax + (numInserted + 1) * hg + START_COLUMN - 1;
    img = ones(height, width, 3) * 255; % RGB has 3 colors, and (255, 255, 255) is white.
    for n = 0:(numInserted + 1) % Totally (numInserted + 2) rectangles should be drawn.
        startR = vg * n + START_ROW;
        startC = hg * n + START_COLUMN;
        endR = startR - 1 + int32(floor(rmin + (rmax - rmin) / (numInserted + 1) * n));
        endC = startC - 1 + int32(floor(cmin + (cmax - cmin) / (numInserted + 1) * n));
        img = drawRectangle(img, startR, startC, endR, endC);
    end
    out = uint8(img);
end