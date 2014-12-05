%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will blend 50 images which are named from 1.jpg to
%50.jpg. The final result is stored as blend.jpg.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

imgBlend = imread('1.jpg');
imgBlend = imresize(imgBlend,[550 550]);
mode = 'normal';

for i=2:50
    img = strcat(mat2str(i),'.jpg');
    img1= imread(img);
    img1=imresize(img1,[550 550]);
    imgBlend = double(imgBlend)+double(img1);
end

imgBlend = imgBlend/50;
imgBlend = uint8(imgBlend);
imshow(imgBlend);
imwrite(imgBlend,'blend.jpg');