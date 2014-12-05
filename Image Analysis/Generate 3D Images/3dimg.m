%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will convert a given image into a 3D image.
%base_img.jpg contains a 2-channel base image which will then be separated
%into left channel and right channel images. Left channel is converted
%to red and right channel is converted to cyan. Then, they are merged
%to the the 3D image.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

%read image
img=imread('base_img.jpg');
[x,y]=size(img);

%get left and right parts of the image
left=imcrop(img,[1 1 359 y]);
right=imcrop(img,[290 1 359 y]);

%red image of left
red=left;
red(:,:,2)=0;
red(:,:,3)=0;
figure(2);
imshow(red);

%cyan image of right
cyan=right;
cyan(:,:,1)=0;
figure(3);
imshow(cyan);

%merge red and cyan images
imgnew=imfuse(red,cyan);
figure(4);
imshow(imgnew);
imwrite(imgnew,'3d_img.jpg');