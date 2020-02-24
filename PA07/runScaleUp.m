% Load image, scale it up and then write it into a new file.
function out = runScaleUp(imageFile, factor, withSmoothing)
    if ~isfile(imageFile)
        error('runScaleUp:FileNotExist', 'File does not exist!');
    end
    if nargin < 3
        withSmoothing = false;
    end
    if nargin < 2
        factor = 2.0;
    end
    img = imread(imageFile);
    img = scaleUp(img, factor, withSmoothing);
    imwrite(img, getNewFileName(imageFile));
    out = img;
end