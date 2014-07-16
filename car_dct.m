clear; clc;

foregroundDetector = vision.ForegroundDetector('NumGaussians', 3, ...
    'NumTrainingFrames', 150, 'LearningRate', 0.001, 'AdaptLearningRate', true);
% , 'ImageColorSpace', 'Intensity'
videoReader = vision.VideoFileReader('mv2_001.avi');
for i = 1:150
    frame = step(videoReader); % read the next video frame
    foreground = step(foregroundDetector, frame);
end

figure; imshow(frame); title('Video Frame');
figure; imshow(foreground); title('Foreground');

se = strel('square', 2);
filteredForeground = imopen(foreground, se);
filteredForeground = imfill(filteredForeground, 'holes');
figure; imshow(filteredForeground); title('Clean Foreground');

blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 150);

blobAnalysis1 = vision.BlobAnalysis('BoundingBoxOutputPort', false, ...
     'AreaOutputPort', false, 'CentroidOutputPort', true, ...
     'MinimumBlobArea', 150);

bbox = step(blobAnalysis, filteredForeground);
bbox1 = step(blobAnalysis1, filteredForeground);

result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');
result = insertMarker(result, bbox1, 'x', 'Color', 'red');

numCars = size(bbox, 1);

result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
    'FontSize', 14);
figure; imshow(result); title('Detected Cars');

videoPlayer = vision.VideoPlayer('Name', 'Detected Cars');
videoPlayer.Position(3:4) = [650,400];  % window size: [width, height]
ctr = 1;

while ~isDone(videoReader)

    frame = step(videoReader); % read the next video frame

    % Detect the foreground in the current video frame
    foreground = step(foregroundDetector, frame);

    % Use morphological opening to remove noise in the foreground
    filteredForeground = imopen(foreground, se);
    filteredForeground = imfill(filteredForeground, 'holes');
    
    % Detect the connected components with the specified minimum area, and
    % compute their bounding boxes
    bbox = step(blobAnalysis, filteredForeground);

    % Draw bounding boxes around the detected cars
    result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');

    % Display the number of cars found in the video frame
    numCars = size(bbox, 1);
    result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
        'FontSize', 14);

    step(videoPlayer, result);  % display the results
    for i = 1:numCars
        cropped_frame = imcrop(frame, bbox(i,:));
        ar = size(cropped_frame, 2)/size(cropped_frame, 1);
    end
end

release(videoReader); % close the video file
