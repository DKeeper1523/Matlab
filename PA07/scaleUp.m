% Scale up the input image data by the 'factor', and if 'withSmoothing' is
% true, apply a smoothing algorithm.
function out = scaleUp(input, factor, withSmoothing)
    if factor <= 0
        error('scaleUp:FactorNotPositive', 'The factor should be a positive number!');
    end
    input = int32(input);
    [h, w, c] = size(input);
    newH = int32(floor(h * factor));    % height of the new image
    newW = int32(floor(w * factor));    % width of the new image
    if newH <= 0 || newW <= 0
        error('scaleUp:FactorTooSmall', 'The factor should be larger!');
    end
    newImg = zeros(newH, newW, c);
    for i = 1:newH
        for j = 1:newW
            newImg(i, j, :) = input(int32(ceil(double(i)/factor)), int32(ceil(double(j)/factor)), :);
        end
    end
    if withSmoothing
        newImg = smoothPixellation(newImg);
    end
    out = uint8(newImg);
end
