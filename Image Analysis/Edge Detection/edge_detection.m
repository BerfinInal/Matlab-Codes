%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will perform Edge detection for a given image. 4
%different edge detection algorithms that are used are Sobel, Prewitt,
%Canny and Roberts.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

img = imread ('image.jpg');
ImgGray = rgb2gray(img);
imgEdge1 = edge(ImgGray,'sobel');
imgEdge1 = imcomplement(imgEdge1);
figure(1);
imshow(imgEdge1);

figure(2);
imgEdge2 = edge(ImgGray,'prewitt');
imgEdge2 = imcomplement(imgEdge2);
imshow(imgEdge2);

figure(3);
imgEdge3 = edge(ImgGray,'canny',0.1);
imgEdge3 = imcomplement(imgEdge3);
imshow(imgEdge3);

figure(4);
imgEdge4 = edge(ImgGray,'roberts');
imgEdge4 = imcomplement(imgEdge4);
imshow(imgEdge4);

