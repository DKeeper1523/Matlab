% Unit tests
function tests = Tests()
    tests = functiontests(localfunctions);
end

function test_drawRectangle(testCase)
    img = ones(4, 4, 3) * 255;
    actual = drawRectangle(img, 1, 2, 3, 4);
    exp = [1 0 0 0; 1 0 1 0; 1 0 0 0; 1 1 1 1] * 255;
    expected(:, :, 1) = exp;
    expected(:, :, 2) = exp;
    expected(:, :, 3) = exp;
    verifyEqual(testCase, actual, expected);
end

function test_buildImage(testCase)
    actual = buildImage(2, 2, 4, 4, 1, 1, 1);
    exp = [0 0 1 1 1 1; 0 0 0 0 1 1; 1 0 0 0 0 0; 1 0 0 0 1 0; 1 1 0 1 1 0; 1 1 0 0 0 0] * 255;
    expected(:, :, 1) = exp;
    expected(:, :, 2) = exp;
    expected(:, :, 3) = exp;
    verifyEqual(testCase, actual, uint8(expected));
end

function test_getNewFileName(testCase)
    actual = getNewFileName('test.jpg');
    expected = 'test-scaled.jpg';
    verifyEqual(testCase, actual, expected);
end
function test_getNewFileName2(testCase)
    actual = getNewFileName('te.st.jpg');
    expected = 'te.st-scaled.jpg';
    verifyEqual(testCase, actual, expected);
end

function test_scaleUp(testCase)
    act = [0 1 1; 0 0 1; 1 1 0] * 255;
    originImg(:, :, 1) = act;
    originImg(:, :, 2) = act;
    originImg(:, :, 3) = act;
    actual = scaleUp(originImg, 2.0, false);
    exp = [0 0 1 1 1 1; 0 0 1 1 1 1; 0 0 0 0 1 1; 0 0 0 0 1 1; 1 1 1 1 0 0; 1 1 1 1 0 0] * 255;
    expected(:, :, 1) = exp;
    expected(:, :, 2) = exp;
    expected(:, :, 3) = exp;
    verifyEqual(testCase, actual, uint8(expected));
end
function test_scaleUp2(testCase)
    act = [0 1 1; 0 0 1; 1 1 0] * 255;
    oriImg(:, :, 1) = act;
    oriImg(:, :, 2) = act;
    oriImg(:, :, 3) = act;
    actual = scaleUp(oriImg, 0.5, false);
    exp = 0;
    expected(:, :, 1) = exp;
    expected(:, :, 2) = exp;
    expected(:, :, 3) = exp;
    verifyEqual(testCase, actual, uint8(expected));
end

function test_smoothPixellation(testCase)
    act = [0 1 1; 0 0 1; 1 1 0];
    originImg(:, :, 1) = act * 255;
    originImg(:, :, 2) = act * 0;
    originImg(:, :, 3) = act * 150;
    actual = smoothPixellation(originImg);
    exp = [0.2 0.6 1; 0.2 0.6 0.6; 0.8 0.6 0.4];
    expected(:, :, 1) = exp * 255;
    expected(:, :, 2) = exp * 0;
    expected(:, :, 3) = exp * 150;
    verifyEqual(testCase, actual, uint8(expected));
end